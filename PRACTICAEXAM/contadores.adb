package body contadores is

   procedure inicializar (C: in out contador) is
   begin 
      c.valor := 0; 
   end inicializar;

   procedure incrementar (C: in out contador) is
   begin 
      c.valor := c.valor + 1;
   end incrementar;

   function valor (C: in out contador) return Integer is
   begin 
      return c.valor;
   end valor;

end contadores;
