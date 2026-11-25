with ada.text_IO; use ada.text_IO;
with Ada.Numerics.dicrete_random;
with ada.gestion_hardware; use ada.gestion_hardware;

procedure Simulacion_os is 
   subtype Rango_Tiempo is Integer range 100 .. 1000;

   package Random_MS is new
      Ada.Numerics.Discrete_Random
      (
         Rango_Tiempo
      );

   task type Sensor is
      entry Start(ID : integer);
   end Sensor;

   Sensores: array (1.. Num_sensores) of Sensor;

   task body Sensor is 
      ID : integer;
      G : Random_MS.Generator;
      tiempo : Rango_Tiempo;
   begin 
      Random_MS.Reset(G);
      accept start(ID_entrada : integer) do
         ID := ID_Entrada;
      end start;

   for I in 1..10 loop
     Tiempo := Random_MS.Random(G);
     delay Duration(tiempo)/1000.0;
     Hardware.Incrementar_sensores(ID);
   end loop;

   --Barrera de reinicio

   select 
     hardware.esperar_reinicio;
   or
       delay 0.1;
    end select;
   
    end Sensor;

begin 
   for I in 1..Num_sensores loop
      Sensores(I).Start(I);
   end loop;

end Simulacion_os; 
