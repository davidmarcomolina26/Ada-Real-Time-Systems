package GestionHardware is

   Num_Sensores : constant Integer := 5;

   type Tabla_Eventos is array (1.. Num_sensores) of Integer;

   protected Eventos_Hardware is
      procedure Escribir_evento(Indice:Integer; Valor:Integer);
      function Leer_Evento(Indice:Integer)return Integer;
      function Get_Total_Eventos return Integer;

      entry Esperar_Reinicio;
   private
      Buffer: Tabla_Eventos := (others => 0);
      Contador_Listas : Integer := 0;
      Puede_Reiniciar : Boolean := False;

      Total_Eventos : Integer :=0;

   end Eventos_Hardware;

end GestionHardware;