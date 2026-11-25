package Fracciones is
   type fraccion_t is private;

   function "+" (X, Y : fraccion_t) return fraccion_t;
   function "-" (X : fraccion_t) return fraccion_t;
   function "-" (X, Y : fraccion_t) return fraccion_t;
   function "*" (X, Y : fraccion_t) return fraccion_t;
   function "/" (X, Y : fraccion_t) return fraccion_t;
   function "=" (X, Y : fraccion_t) return Boolean;

   -- Entrada / salida
   procedure Leer (F : out fraccion_t);
   procedure Escribir (F : fraccion_t);

   -- Constructor
   function "/" (X, Y : Integer) return fraccion_t;

   -- Selectores
   function Numerador (F : fraccion_t) return Integer;
   function Denominador (F : fraccion_t) return Positive;

private
   type fraccion_t is record
      Num : Integer;
      Den : Positive;
   end record;
end Fracciones;