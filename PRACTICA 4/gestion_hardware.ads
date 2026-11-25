package Gestion_Hardware is

   Num_Sensores : constant Integer := 5;

   -- El tipo debe ser visible para el objeto protegido
   type Tabla_Eventos is array (1 .. Num_Sensores) of Integer;

   protected Eventos_Hardware is
      procedure Escribir_Evento (Indice : Integer; Valor : Integer);
      function Leer_Evento (Indice : Integer) return Integer;
      function Get_Total_Eventos return Integer;

      entry Esperar_Reinicio;

   private
      Buffer          : Tabla_Eventos := (others => 0);
      Contador_Listos : Integer := 0;
      Puede_Reiniciar : Boolean := False;

      Total_Eventos : Integer := 0; -- Variable para contar el total de eventos escritos  


   end Eventos_Hardware;

end Gestion_Hardware;
