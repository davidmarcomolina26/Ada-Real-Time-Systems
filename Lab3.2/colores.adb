with Ada.Text_IO; use Ada.Text_IO;
 
package body colores is
    procedure Put_Line_color(line : string; color : color_t) is
        RESET : aliased constant String := ESC & "[0m";
    begin
        Put_Line(Get_color_string(color) & line & RESET);
    end Put_Line_color;
    
    function Get_color_string(color : color_t) return String is
    begin
        case color is
            when Red => return ESC & "[91m";
            when Green => return ESC & "[92m";
            when Blue => return ESC & "[94m";
            when Yelow => return ESC & "[93m";
            when Magenta => return ESC & "[95m";
            when Cyan => return ESC & "[96m";
        end case; 
    end Get_color_string;
end colores; 