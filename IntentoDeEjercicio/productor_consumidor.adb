with Ada.Text_IO;
use Ada.Text_IO;

procedure Productor_Consumidor is
   --Objeto protegido que representa el buffer compartido entre el productor y el consumidor
   protected Buffer is
      
      entry Put(X : Integer);
      
      entry Get(X : out Integer);

   private
      --Variable que representa el dato producido o consumido
      Dato : Integer := 0;

      --Variable que indica si el buffer está disponible para producir o consumir
      Disponible : Boolean := False;

   end Buffer;

   protected body Buffer is

      -- IMPLEMENTAR

      --PUT
      entry Put(X : Integer) when not Disponible is
      begin
         Dato := X;
         Disponible := True;
      end Put;
      --GET
      entry Get(X : out Integer) when Disponible is
      begin
         X := Dato; 
         Disponible := False;
      end Get;
   
   end Buffer;

   --TAREAS

   task Productor;

   task Consumidor;

   task body Productor is
   begin
      for i in 1 .. 10 loop
         Buffer.Put(I);
         -- 'Image' es una función de Ada que convierte un valor a su representación en cadena
         Put_Line("productor ha producido:" & Integer'Image(I));

         delay 0.5; -- Simula el tiempo de producción
      end loop;

   end Productor;

   task body Consumidor is

      Valor : Integer;

   begin

      for i in 1.. 10 loop
         Buffer.Get(Valor);
         Put_Line("consumidor ha consumido:" & Integer'Image(Valor));
         delay 1.0; -- Simula el tiempo de consumo
      end loop;
   end Consumidor;

begin

   null;

end Productor_Consumidor;