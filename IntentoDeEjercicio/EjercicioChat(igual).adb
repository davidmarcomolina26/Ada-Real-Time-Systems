--Implementa un sistema concurrente de sensores en Ada.

--El sistema estará formado por:

--3 tareas sensor
--1 objeto protegido compartido

--Cada sensor:

--recibe un identificador mediante Start(ID : Integer)
---genera eventos periódicamente
--incrementa su contador en el objeto protegido

--El objeto protegido:

--almacena el número de eventos de cada sensor
--garantiza exclusión mutua
--permite consultar valores concurrentemente


with Ada.Text_IO;
use Ada.Text_IO;

procedure Sensores is

   -------------------------------------------------
   -- CONSTANTES
   -------------------------------------------------

   Num_Sensores : constant Integer := 3;

   -------------------------------------------------
   -- OBJETO PROTEGIDO
   -------------------------------------------------

   protected Hardware is

      ------------------------------------------------
      -- COMPLETAR
      ------------------------------------------------
      --Aqui van los procedimientos y funciones del objeto protegido
      procedure Incremenentar(ID: Integer);

      function leer (ID: Integer) return Integer;

   private

      Buffer : array (1 .. Num_Sensores) of Integer :=
         (others => 0);

   end Hardware;

   -------------------------------------------------
   -- BODY HARDWARE
   -------------------------------------------------

   protected body Hardware is

      ------------------------------------------------
      -- COMPLETAR
      ------------------------------------------------

      --Incrementar el contador del sensor ID
      procedure Incrementar(ID:Integer) is
      begin
         Buffer(ID) := Buffer(ID) +1;
      end Incrementar;

      --Leer el contador del sensor ID
      function leer (ID: Integer) return Integer is
      begin
         return Buffer(ID);
      end leer;

   end Hardware;

   -------------------------------------------------
   -- TASK TYPE
   -------------------------------------------------

   task type Sensor is

      ------------------------------------------------
      -- COMPLETAR
      ------------------------------------------------
      entry Start(ID:Integer);

   end Sensor;

   -------------------------------------------------
   -- ARRAY DE TAREAS
   -------------------------------------------------

   Sensores_Array : array (1 .. Num_Sensores) of Sensor;

   -------------------------------------------------
   -- TASK BODY
   -------------------------------------------------

   task body Sensor is

      ID : Integer;

   begin

      ------------------------------------------------
      -- COMPLETAR ACCEPT
      ------------------------------------------------
      accept Start(ID_Entrada:Integer) do
         ID := ID_Entrada;
      end Start;

      for I in 1 .. 10 loop

         delay 0.5;

         ------------------------------------------------
         -- INCREMENTAR CONTADOR
         ------------------------------------------------
         Hardware.Incrementar(ID);
         
         Put_Line
         (
            "Sensor"
            & Integer'Image(ID)
            & " -> "
            & Integer'Image
            (
               ------------------------------------------------
               -- LEER VALOR
               ------------------------------------------------
               Hardware.leer(ID)
            )
         );

      end loop;

   end Sensor;

begin

   -------------------------------------------------
   -- INICIAR TAREAS
   -------------------------------------------------

   for I in 1 .. Num_Sensores loop

      ------------------------------------------------
      -- COMPLETAR
      ------------------------------------------------
      Sensores_Array(i).start(i);

   end loop;

end Sensores;