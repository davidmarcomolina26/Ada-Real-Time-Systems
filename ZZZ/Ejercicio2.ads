with Ada.Text_IO; use Ada.Text_IO;

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Version_A is

   -- TASK BUFFER (SERVIDOR)
   task Buffer is

      entry Put(X : Integer);

      entry Get(X : out Integer);

   end Buffer;

   -- PRODUCTOR
   task Productor;

   -- CONSUMIDOR
   task Consumidor;

   -- BODY BUFFER
   task body Buffer is

      Dato : Integer := 0;

      Disponible : Boolean := False;

   begin

      loop

         select

            -- PUT

            when not Disponible =>

               accept Put(X : Integer) do

                  Dato := X;

                  Disponible := True;

               end Put;

         or

            -- GET

            when Disponible =>

               accept Get(X : out Integer) do

                  X := Dato;

                  Disponible := False;

               end Get;

         end select;

      end loop;

   end Buffer;

   -- BODY PRODUCTOR

   task body Productor is
   begin

      for I in 1 .. 10 loop

         Buffer.Put(I);

         Put_Line("Productor produce:" & Integer'Image(I));

         delay 0.5;

      end loop;

   end Productor;

   -- BODY CONSUMIDOR

   task body Consumidor is

      Valor : Integer;

   begin

      for I in 1 .. 10 loop

         Buffer.Get(Valor);

         Put_Line
         ("Consumidor consume:" & Integer'Image(Valor));

         delay 1.0;

      end loop;

   end Consumidor;

begin

   null;

end Version_A;