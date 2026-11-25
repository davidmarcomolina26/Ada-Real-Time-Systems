with Ada.Text_IO ; -- Incluimos el paquete Text_IO de Ada
use Ada.Text_IO ;  -- Es similar a namespace en C ++

procedure Area is
    -- Declaramos un tipo longitud en metros con precision de mm
    type longitud_metros_t is delta 0.001 range 0.0..100.0;

    type augusto is delta 0.5 range 0.0..100.0;             -- works
    --type augusto is new Float delta 0.5 range 0.0..100.0; -- doesnt work .. why?

   type masa_t is delta 0.125 range 0.0..12.0;


    -- Como hemos declarado un tipo nuevo necesitamos un paquete de entrada/salida para ese tipo
    package ES_longitud_metros is new Ada.Text_Io.Fixed_Io(longitud_metros_t);
        
    largo,ancho : longitud_metros_t;
    pi : augusto;
begin
    Put("Introduce el largo en metros: ");
    ES_longitud_metros.Get(largo);
    set_col(5);
    Put("Has introducido: ");
    ES_longitud_metros.Put(largo); 
    New_line(2);
    Put("Introduce el ancho en metros: ");
    ES_longitud_metros.Get(ancho);
    set_col(5);    
    Put("Has introducido: ");
    ES_longitud_metros.Put(ancho);       
    New_line(2);
    set_col(35);
    Put_line("El área total es: " & longitud_metros_t'image(ancho*largo));    


   pi := 3.14159;
   Put_line("El valor de pi es: " & augusto'image(pi));

--  exception
--        when DATA_ERROR =>
--            New_line(2);
--            Put("Debes introducir un valor válido");    
end Area ;
