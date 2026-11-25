package gestion_hardware is

   --Constantes

   Num_sensores : constant Integer := 4;

   --Objeto protegido

   protected Hardware is

      procedure Incrementar_sensor (ID : Integer);
      
      function Leer (ID : Integer) return Integer;

      --barrera de reinicio
      entry esperar_reinicio;
   private
      --buffer eventos
      buffer : array (1..Num_sensores) of Integer := (others => 0);

      --contador de ciclos completos
      Total_eventos : Integer := 0;

   end Hardware;

end gestion_hardware;