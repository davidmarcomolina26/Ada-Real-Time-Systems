package colores is
    type color_t is (RED, GREEN, BLUE, YELOW, CYAN, MAGENTA);
 
 
    procedure Put_Line_color(line : string; color : color_t);   
 
 
    function Get_color_string(color : color_t) return String;   
end colores;