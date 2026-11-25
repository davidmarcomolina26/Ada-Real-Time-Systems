with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO; -- Para control de ancho fijo [cite: 1083]
with Ada.Numerics.Discrete_Random;
with Gestion_Hardware;    use Gestion_Hardware;

procedure Simulacion_OS is

   -- Define ANSI escape codes for colors
   -- Look! These variables are shared between the main program and the tasks!
   Green     : constant String := ASCII.ESC & "[32m";  -- Green
   Red       : constant String := ASCII.ESC & "[31m";  -- Red
   Yellow    : constant String := ASCII.ESC & "[33m"; -- Yellow
   Blue      : constant String := ASCII.ESC & "[34m"; -- Blue
   Magenta   : constant String := ASCII.ESC & "[35m"; -- Magenta
   Reset     : constant String := ASCII.ESC & "[0m";   -- Reset to default
   Tab       : constant Character := Character'Val(9);  -- ASCII 9 (Tab) , used to indent the text, C/C++ \t equivalent.
   Flashing  : constant String := ASCII.ESC & "[5m"; -- Flashing text
   Bold      : constant String := ASCII.ESC & "[1m";
   Italics   : constant String := ASCII.ESC & "[3m";
   Underline : constant String := ASCII.ESC & "[4m";

   subtype Rango_MS is Integer range 100 .. 2000;
   package Random_MS is new Ada.Numerics.Discrete_Random (Rango_MS);

   G_Main : Random_MS.Generator;

   task type Tarea_Sensor is
      entry Start (ID : Integer);
   end Tarea_Sensor;

   task body Tarea_Sensor is
      G       : Random_MS.Generator;
      Lectura : Integer := 0;
      Mi_ID   : Integer; -- Variable local para guardar la identidad
   begin

      accept Start (ID : Integer) do
         Mi_ID := ID;
      end Start;

      Random_MS.Reset (G);
      loop
         delay Duration (Random_MS.Random (G)) / 1000.0;

         Lectura := Lectura + 1;
         Eventos_Hardware.Escribir_Evento (Mi_ID, Lectura);


         if Lectura = 20 then

            select
               Eventos_Hardware.Esperar_Reinicio;
            or
               delay
                 20.0; -- Timeout para evitar que la tarea quede bloqueada indefinidamente
               Put_Line(Yellow & "Warning: Sensor" & Integer'Image (Mi_ID) & " lleva 20s esperando en la barrera!" & Reset);
            end select;

            Lectura := 0;
         end if;

      end loop;
   end Tarea_Sensor;

   Mis_Sensores : array (1 .. Num_Sensores) of Tarea_Sensor;
   
   procedure Dibujar_Barra (Valor : Integer) is
   begin
      Put (" [");
      for J in 1 .. 20 loop
         if J <= Valor then
            if Valor = 20 then
               Put ("!");
            else
               Put ("#");
            end if;
         else
            Put (" ");
         end if;
      end loop;
      Put ("] ");
   end Dibujar_Barra;

begin

   Random_MS.Reset (G_Main); -- Inicializamos el generador del main

   -- Fase de activación: Asignamos IDs uno a uno mediante la entrada Start
   for I in Mis_Sensores'Range loop
      Mis_Sensores (I).Start (I);
   end loop;


   Put (ASCII.ESC & "[2J");

   loop
      Put (ASCII.ESC & "[H"); -- Mover cursor arriba (Home) [cite: 2873]

      Put_Line ("===========================================");
      Put_Line ("       SISTEMA OPERATIVO: EVENTOS HW       ");
      Put_Line ("===========================================");
      Put_Line ("  ID  |  VALOR   |      VISUALIZACION      ");
      Put_Line ("------|----------|-------------------------");

      for I in 1 .. Num_Sensores loop
         declare
            V : Integer := Eventos_Hardware.Leer_Evento (I);

         begin
            V := Eventos_Hardware.Leer_Evento (I);

            -- Usamos Width para asegurar que el ID siempre ocupe 4 espacios
            Put (I, Width => 4);
            Put ("  | ");
            Put (V, Width => 8);
            Put (" |");

            Dibujar_Barra (V);

            New_Line;
         end;
      end loop;

      Put_Line ("===========================================");
      Put_Line
        (" Status: Tareas concurrentes activas...    "
         & "Total eventos procesados: "
         & Integer'Image (Eventos_Hardware.Get_Total_Eventos));

      delay 0.25;
   end loop;
end Simulacion_OS;
