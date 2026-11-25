with privado;
 
procedure principal is
    b1 : privado.target_t;
    b2 : privado.target_t;
begin
    b1 := privado.Asignar_blanco(4,7);
 
    -- b1.y :=-3; --  ¡¡¡ ERROR !!!
    
    privado.Imprimir_blanco(b1);
 
    b2:=b1; -- Podemos hacer copias de los objetos!!!
 
    privado.Imprimir_blanco(b2);
    
end principal;