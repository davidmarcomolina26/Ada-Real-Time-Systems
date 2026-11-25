with Ada.Text_IO;
use Ada.Text_IO;

procedure Buffer_Bloqueante is

   -------------------------------------------------
   -- OBJETO PROTEGIDO
   -------------------------------------------------

   protected Buffer is

      ------------------------------------------------
      -- COMPLETAR
      ------------------------------------------------

   private

      Dato : Integer := 0;

      Disponible : Boolean := False;

   end Buffer;

   -------------------------------------------------
   -- BODY BUFFER
   -------------------------------------------------

   protected body Buffer is

      ------------------------------------------------
      -- COMPLETAR
      ------------------------------------------------

   end Buffer;

   -------------------------------------------------
   -- TAREAS
   -------------------------------------------------

   task Productor;

   task Consumidor;

   -------------------------------------------------
   -- PRODUCTOR
   -------------------------------------------------

   task body Productor is
   begin

      for I in 1 .. 15 loop

         ------------------------------------------------
         -- COMPLETAR
         ------------------------------------------------

         Put_Line
         (
            "Producido:"
            & Integer'Image(I)
         );

         delay 0.3;

      end loop;

   end Productor;

   -------------------------------------------------
   -- CONSUMIDOR
   -------------------------------------------------

   task body Consumidor is

      Valor : Integer;

   begin

      for I in 1 .. 15 loop

         ------------------------------------------------
         -- COMPLETAR
         ------------------------------------------------

         Put_Line
         (
            "Consumido:"
            & Integer'Image(Valor)
         );

         delay 0.5;

      end loop;

   end Consumidor;

begin

   null;

end Buffer_Bloqueante;