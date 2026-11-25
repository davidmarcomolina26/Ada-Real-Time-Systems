with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;
 
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
            when Yellow => return ESC & "[93m";
            when Magenta => return ESC & "[95m";
            when Cyan => return ESC & "[96m";
        end case; 
    end Get_color_string;
  
   -- We create thee color_t as a private type so now we need a new
   -- way to create new colors. We will use the first letter of the color
   -- and this function will return the color_t. I know this is quite unusual
   -- and a little bit dirty but it is just for learning purposes.
   function Get_keyword_initial(initial: Character) return color_t is
   begin
      case initial is
         when 'R' => return Red;
         when 'G' => return Green;
         when 'B' => return Blue;
         when 'Y' => return Yellow;
         when 'M' => return Magenta;
         when 'C' => return Cyan;
         when others => raise Constraint_Error;
      end case;
   end Get_keyword_initial;
 
   procedure private_procedure is 
   begin
      Put_Line("This is a private procedure");
   end private_procedure;
  
end colores;