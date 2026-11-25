with Ada.Text_IO; use Ada.Text_IO;
 
package body privado_limitado is
    procedure Asignar_blanco(x , y: Integer; T : out target_t) is
    begin
        T.x :=x;
        T.y :=y;
    end;
 
    procedure Imprimir_blanco(T : target_t) is
    begin
        Put_Line("El blanco está en " & Integer'image(T.x) & " " & Integer'image(T.y));
    end Imprimir_blanco;
end privado_limitado;