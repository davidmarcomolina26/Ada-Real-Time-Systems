with Ada.Text_IO ; -- Incluimos el paquete Text_IO de Ada
use Ada.Text_IO ;  -- Es similar a namespace en C ++

procedure Arrays is
    --package ES_ent is new Ada.Text_Io.Integer_Io(Integer);

    type int_t is new Integer range 0..500;
    --package p_int is new Ada.Text_Io.Integer_Io(int_t);  -- this isnt needed since we're not using input/output for int_t
    type vector_t is array (1..5) of int_t;   

    B : vector_t := (3, 23, 4, 67, 332);
        
    A: array(1..5) of Integer := (3, 23, 4, 67, 332); 
        -- Esto se puede hacer pero no es lo recomendado ya que crea un tipo sin 
        -- nombrarlo 
begin
    set_col(5);    
    Put_line("La suma de sus elementos es : " & Integer'image(A(1)+A(2)+A(3)+A(4)+A(5)));
    set_col(5);
    Put_line("La suma de sus elementos es : " & int_t'image(B(1)+B(2)+B(3)+B(4)+B(5)));
    --ES_ent.Put(A(1));
    New_line(2);
    set_col(5);
    Put("La suma de sus elementos impares es : " & Integer'image(A(1)+A(3)+A(5)));
    New_line(2);    
end Arrays;
