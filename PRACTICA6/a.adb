with Ada.Text_IO;
use Ada.Text_IO;

procedure Prod_Cons_Entry is

   task Buffer is
      entry Put(Item : in Integer);
      entry Get(Item : out Integer);
   end Buffer;

   task body Buffer is
      Data  : Integer := 0;
      Full  : Boolean := False;
   begin
      loop
         select
            when not Full =>
               accept Put(Item : in Integer) do
                  Data := Item;
                  Full := True;
               end Put;
         or
            when Full =>
               accept Get(Item : out Integer) do
                  Item := Data;
                  Full := False;
               end Get;
        or 
        delay (10.0);
        Put_Line("Waiting for 10s!!!");
         end select;
      end loop;
   end Buffer;

   task Producer;
   task Consumer;

   task body Producer is
   begin
      for I in 1 .. 5 loop
         Put_Line("Producer produces" & Integer'Image(I));
         Buffer.Put(I);
      end loop;
   end Producer;

   task body Consumer is
      Value : Integer;
   begin
      for I in 1 .. 5 loop
         Buffer.Get(Value);
         Put_Line("Consumer consumes" & Integer'Image(Value));
      end loop;
   end Consumer;

begin
   null;
end Prod_Cons_Entry;
