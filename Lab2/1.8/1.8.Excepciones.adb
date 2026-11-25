with Ada.Text_IO ; -- Incluimos el paquete Text_IO de Ada
use Ada.Text_IO ;  -- Es similar a namespace en C ++

procedure Excepciones is
    package ES_int is new Ada.Text_Io.Integer_Io(Natural);
    
    canastas2 : Natural;
    triples : Natural;
    libres : Natural;
begin
    Put("Introduce el número de canastas de 2: ");
    ES_int.Get(canastas2);
    set_col(5);
    Put("Has introducido: ");
    ES_int.Put(canastas2); 
    New_line(1);
    Put("Introduce el número de canastas de 3: ");
    ES_int.Get(triples);
    set_col(5);    
    Put("Has introducido: ");
    ES_int.Put(triples);       
    New_line(1);
    Put("Introduce el número de tiros libres: ");
    ES_int.Get(libres);
    set_col(5);    
    Put("Has introducido: ");
    ES_int.Put(libres);           
    New_line(2);
    Put("Los puntos totales son: " & Integer'image(triples*3+canastas2*2+libres));    
exception
    when Data_Error =>
        set_col(15);        
        Put ("Has introducido un dato incorrecto");
        New_line(2);
    when others =>
        set_col(15);        
        Put ("Error desconocido");        
        New_line(2);        
end Excepciones ;
