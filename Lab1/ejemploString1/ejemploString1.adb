-- Ejemplo de Ada.Text_IO con strings
with Ada.Text_IO; use Ada.Text_IO;

procedure ejemploString1 is
       s1: String(1 .. 2);           
       s2: String(1 .. 3);          
begin
       put("Introduce 5 caracteres y pulsa enter.. ");
       -- Al ser la cadena s1 de longitud 2 lee los 2 primeros
       get(s1);
       put_line("Primeros 2: " & s1);

       -- Al ser la cadena s2 de longitud 3 lee los 3 siguientes
       get(s2);
       put_line("Siguientes 3: " & s2);
       new_line;
       
end ejemploString1; 
