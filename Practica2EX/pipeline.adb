with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Ejercicio1 is

   package Float_IO is new Ada.Text_IO.Float_IO (Float);
   use Float_IO;

   subtype Newton is Float;
   subtype Pound_force is Float;

   type noseque is record
      Id : Integer;
      F : Newton;
   end record;

   type array_reg is array(1..4) of noseque;

   function Convertir (F : Newton) return Pound_force is
   begin
      return F / 4.44822;
   end Convertir; 

   F1 : Newton := 10.0;
   F2 : Newton := 20.0;
   F3 : Newton := 30.0;
   F4 : Newton := 40.0;
   R1 : Pound_force := Convertir(F1);
   R2 : Pound_force := Convertir(F2);
   R3 : Pound_force := Convertir(F3);
   R4 : Pound_force := Convertir(F4);
   Registros : array_reg := ((Id => 1, F => F1), (Id => 2, F => F2), (Id => 3, F => F3), (Id => 4, F => F4));

begin  
      for I in Registros'Range loop
            Put("Registro " & Integer'Image(Registros(I).Id) & ": ");
            Put(Registros(I).F, Exp => 0);
            Put(" N = ");
            Put(Convertir(Registros(I).F), Exp => 0);
            Put_Line(" lbf");
      end loop;
      Put("Suma de los resultados en lbf: ");
      Put(R1 + R2 + R3 + R4, Exp => 0);

end Ejercicio1;