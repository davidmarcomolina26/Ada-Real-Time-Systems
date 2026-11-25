with GNAT.OS_Lib;

package body Gestion_Hardware is

   protected body Eventos_Hardware is
      procedure Escribir_Evento (Indice : Integer; Valor : Integer) is
      begin

         if Indice in Buffer'Range then
            Buffer (Indice) := Valor;

            if Valor = 20 then
               Contador_Listos := Contador_Listos + 1;
            end if;

            if Contador_Listos >= Num_Sensores then
               Puede_Reiniciar := True;               
            end if;
         
         else
            Total_Eventos := 999;
         end if;

      end Escribir_Evento;

      function Leer_Evento (Indice : Integer) return Integer is
      begin
         --delay 0.5;
         if Indice in Buffer'Range then
            return Buffer (Indice);
         else
            GNAT.OS_Lib.OS_Exit (1);
            return 0;
         end if;
      end Leer_Evento;

entry Esperar_Reinicio when Puede_Reiniciar is
begin
   -- Incrementamos un contador de "Salida" o usamos el Contador_Listos hacia abajo
   Contador_Listos := Contador_Listos - 1; 

   if Contador_Listos = 0 then
      -- SOLO cuando el último de los que estaban esperando sale, cerramos
      Puede_Reiniciar := False;
      Buffer          := (others => 0);
      Total_Eventos   := Total_Eventos + 1;
   end if;
   
end Esperar_Reinicio;

      function Get_Total_Eventos return Integer is
      begin
         return Total_Eventos;
      end Get_Total_Eventos;

   end Eventos_Hardware;

end Gestion_Hardware;
