-- Ejemplo de Ada.Text_IO con Float
with Ada.Text_IO; use Ada.Text_IO;


procedure CalculaIVA is
       -- Instanciamos un paquete a partir del generico Text_Io.Float_Io que maneja Floats    
       package ES_Float is new Ada.Text_Io.Float_Io(Float);

       precio: Float;           
       preciosiniva: Float;
       IVA: Float;           
begin
       put("Introduce el precio con IVA: ");
       -- Ahora el usuario introducira por teclado una cadena de texto
       ES_Float.get(precio);
       
       
       -- El paquete ES_Float ha leido la cadena y la ha transformado a Float  
       IVA := precio *(1.0 - 1.0 / 1.20);
       preciosiniva := precio / 1.20;
       put_line("El IVA del producto es " & IVA'Image & " y el precio sin IVA es " & preciosiniva'Image);

end CalculaIVA;
