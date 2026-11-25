with Ada.Text_IO;
use Ada.Text_IO;

package body Fracciones is

   package Integer_IO is new Ada.Text_IO.Integer_IO (Integer);
   use Integer_IO;

   -- Máximo común divisor
   function MCD (A, B : Integer) return Integer is
      X : Integer := abs(A);
      Y : Integer := abs(B);
      T : Integer;
   begin
      while Y /= 0 loop
         T := X mod Y;
         X := Y;
         Y := T;
      end loop;
      return X;
   end MCD;

   -- Normalización (irreducible y denominador positivo)
   function Normalizar (N, D : Integer) return fraccion_t is
      Num : Integer := N;
      Den : Integer := D;
      G   : Integer;
   begin
      if Den = 0 then
         raise Constraint_Error;
      end if;

      if Den < 0 then
         Num := -Num;
         Den := -Den;
      end if;

      G := MCD (Num, Den);

      return (Num => Num / G,
              Den => Positive (Den / G)); 
   end Normalizar;

   -- Constructor
   function "/" (X, Y : Integer) return fraccion_t is
   begin
      return Normalizar (X, Y);
   end "/";

   -- Operadores
   function "+" (X, Y : fraccion_t) return fraccion_t is
   begin
      return Normalizar (
         X.Num * Y.Den + Y.Num * X.Den,
         X.Den * Y.Den
      );
   end "+";

   function "-" (X : fraccion_t) return fraccion_t is
   begin
      return (Num => -X.Num, Den => X.Den);
   end "-";

   function "-" (X, Y : fraccion_t) return fraccion_t is
   begin
      return X + (-Y);
   end "-";

   function "*" (X, Y : fraccion_t) return fraccion_t is
   begin
      return Normalizar (
         X.Num * Y.Num,
         X.Den * Y.Den
      );
   end "*";

   function "/" (X, Y : fraccion_t) return fraccion_t is
   begin
      if Y.Num = 0 then
         raise Constraint_Error;
      end if;

      return Normalizar (
         X.Num * Y.Den,
         X.Den * Y.Num
      );
   end "/";

   function "=" (X, Y : fraccion_t) return Boolean is
   begin
      return X.Num * Y.Den = Y.Num * X.Den;
   end "=";

   -- Entrada / salida
   procedure Leer (F : out fraccion_t) is
      N, D : Integer;
   begin
      Get (N);
      Get (D);
      F := N / D;
   end Leer;

   procedure Escribir (F : fraccion_t) is
   begin
      Put (Integer'Image (F.Num));
      Put ("/");
      Put (Integer'Image (F.Den));
   end Escribir;

   -- Selectores
   function Numerador (F : fraccion_t) return Integer is
   begin
      return F.Num;
   end Numerador;

   function Denominador (F : fraccion_t) return Positive is
   begin
      return F.Den;
   end Denominador;

end Fracciones;