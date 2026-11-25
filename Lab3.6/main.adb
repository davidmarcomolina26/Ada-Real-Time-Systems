with colores; 
 
-- use colores;   -- with this line we can avoid to use colores.Put_line_color and colores.Get_keyword_initial
 
with ada.Text_IO; use ada.Text_IO;  
 
procedure main is
    cad : string(1..4);
  
    color_privado : colores.color_t; -- We can use the type even if it is private! the thing is that we 
                                     -- cannot assign values to it like color_privado := colores.Red;
                                     -- See the error below just before the end main;
  
    color_privado2 : colores.color_t;
  
begin
  
   -- Remember that we use colors.xxxx because we have not used the "use colores;" clause
  
   -- Also remember that a character literal is a string of length 1, in other words, the 
   -- character 'R' is a string of length 1. 
   -- To specify a character literal we use single quotes while strings are specified with 
   -- double quotes.
  
   colores.Put_line_color("--> Pintamos de color rojo", colores.Get_keyword_initial('R'));   
   colores.Put_line_color("--> Pintamos de color verde", colores.Get_keyword_initial('G'));   
   colores.Put_line_color("--> Pintamos de color amarillo", colores.Get_keyword_initial('Y'));   
   colores.Put_line_color("--> Pintamos de color morado", colores.Get_keyword_initial('M'));   
   colores.Put_line_color("--> Pintamos de color azul", colores.Get_keyword_initial('B'));   
   colores.Put_line_color("--> Pintamos de color cyan", colores.Get_keyword_initial('C'));   
 
 
   -- color_privado := colores.Red;
   --    PLEASE READ:
   --    We cannot do this because Red is not a visible entity of colores, is private. The generated error is:
   --    main.adb:28:28: error: "Red" is not a visible entity of "colores". 
   --    You can try to replicate the error by uncommenting the previous line and recompiling with the command:
   --    gnatmake main.adb
 
 
   
   color_privado := colores.Get_keyword_initial('R');
   --    PLEASE READ:
   --    We can do this because Get_keyword_initial is a visible entity of colores AND the type is private. 
   --    It would not be possible if the type was limited private! Also the following would not be possible with a limited private type:
   --    color_privado2 := color_privado; 
   --    and the error would be:
   --    main.adb:39:04: error: left hand of assignment must not be limited type.cad
 
 
   --    You can try yourself by adding the limited keyword to the type declaration in colores.ads like this:
   --
   --                      type color_t is limited private;  
   --       instead of
   --                      type color_t is private;
 
 
   
   -- colores.private_procedure;
   --    PLEASE READ:
   --    We can NOT call this procedure from the main program because it is private! If you try to compile uncommenting the line above you will get:
   --    main.adb:54:11: error: "private_procedure" is not a visible entity of "colores"
 
end main;