package colores is
   type color_t is private; 
   -- we need to anticipate the type 
   -- otherwise we cannot use in the 
   -- definition of the Put_Line_color
   
   procedure Put_Line_color(line : string; color : color_t);   
   function Get_color_string(color : color_t) return String;  
   function Get_keyword_initial(initial: Character) return color_t;
 
   -- We can also declare private procedures in a package. To do this, 
   -- we just need to create the procedure in the package body (the adb file). 
   -- We can optionally declare the procedure here in the package specification 
   -- (the ads file) as private (see below in the private section).  
 
 private
   -- let's define the new type we already anticipated. 
   -- if we forget to do it, the compiler will complain with
   -- colores.ads:2:09: error: missing full declaration for private type "color_t"
   
   type color_t is (RED, GREEN, BLUE, YELLOW, CYAN, MAGENTA);
 
   -- this is optional, to create a private procedure we can just add the procedure 
   -- in the package body (the adb file).
   procedure private_procedure;
 
end colores;