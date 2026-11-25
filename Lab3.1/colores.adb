with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;
 
 
package body colores is
    procedure Put_Line_RED(line : string) is
        RED : aliased constant String := ESC & "[91m";
        RESET : aliased constant String := ESC & "[0m";
    begin
        Put_Line(RED & line & RESET);
    end Put_Line_RED;
    
    procedure Put_Line_CYAN(line : string) is
        CYAN : aliased constant String := ESC & "[96m";
        RESET : aliased constant String := ESC & "[0m";
    begin
        Put_Line(CYAN & line & RESET);
    end Put_Line_CYAN;
 
 
    procedure Put_Line_YELOW(line : string) is
        YELOW : aliased constant String := ESC & "[93m";
        RESET : aliased constant String := ESC & "[0m";
    begin
        Put_Line(YELOW & line & RESET);
    end Put_Line_YELOW;
 
 
    procedure Put_Line_BLUE(line : string) is
        BLUE : aliased constant String := ESC & "[94m";
        RESET : aliased constant String := ESC & "[0m";
    begin
        Put_Line(BLUE & line & RESET);
    end Put_Line_BLUE;    
 
 
    procedure Put_Line_MAGENTA(line : string) is
        MAGENTA : aliased constant String := ESC & "[95m";
        RESET : aliased constant String := ESC & "[0m";
    begin
        Put_Line(MAGENTA & line & RESET);
    end Put_Line_MAGENTA;      
 
 
    procedure Put_Line_GREEN(line : string) is
        GREEN : aliased constant String := ESC & "[92m";
        RESET : aliased constant String := ESC & "[0m";
    begin
        Put_Line(GREEN & line & RESET);
    end Put_Line_GREEN;        
end colores;