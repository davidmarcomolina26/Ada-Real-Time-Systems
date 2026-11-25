with publico;
 
procedure principal is
   b1 : publico.target_t;
begin
    b1 := publico.Asignar_blanco(4,7);
 
    publico.Imprimir_blanco(b1);
 
    b1.y := -3;  -- Cualquiera puede modificar el contenido!!
 
    publico.Imprimir_blanco(b1);
    
end principal;