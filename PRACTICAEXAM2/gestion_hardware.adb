package body gestion_hardware is

    protected body Hardware is
      
        procedure Incrementar_sensores (ID : Integer) is
        begin
            Buffer(ID) := Buffer(ID) + 1;

        end Incrementar_sensores;

        function Leer (ID : Integer) return Integer is
        begin
            return Buffer(ID);
        end leer;

        --Barrera de reinicio
        entry esperar_reinicio when (for all I in buffer'Range => Buffer(I) = 10) is
        begin 
           --Ultima tarea liberada
           if esperar_reinicio'Count = 0 then
               --Reinicio de buffer
               for I in buffer'Range loop
                    Buffer(I) := 0;
                end loop;

                Total_eventos := total_eventos +1;
           end if;

        end esperar_reinicio;

    end Hardware;

end gestion_hardware;