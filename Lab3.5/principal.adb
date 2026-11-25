with privado_limitado;
 
procedure principal is
   b1 : privado_limitado.target_t;
begin
    -- b1.y := -3;
    -- b1 := privado_limitado.Asignar_blanco(4,7);
    privado_limitado.Asignar_blanco(4,7, b1);
    privado_limitado.Imprimir_blanco(b1);
end principal;