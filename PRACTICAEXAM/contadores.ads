package contadores is

   type contador is private;

   procedure inicializar (C: in out contador);
   procedure incrementar (C: in out contador);
   function valor (c: in out contador) 
      return Integer;

private
   -- INICIALIZAR EL CONTADOR A 0
   type contador is record
      valor: Integer := 0;
   end record;

end contadores;