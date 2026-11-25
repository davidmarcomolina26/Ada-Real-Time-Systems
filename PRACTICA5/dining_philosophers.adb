with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with forks;               use forks;
with Ada.Numerics.Discrete_Random;

procedure dining_philosophers is

   subtype Rango_Tiempo is Integer range 1000 .. 3000;
   package Random_MS is new Ada.Numerics.Discrete_Random (Rango_Tiempo);

   subtype Philosopher_Index is Positive range 1 .. 26;
   subtype Philosopher_Count is Positive range 1 .. 26;
   subtype Fork_Id is Natural range 0 .. 26;

   type Philosopher_State is (Joined, Waiting, Eating, Thinking);
   type State_Array is array (Philosopher_Index) of Philosopher_State;
   type Fork_Id_Array is array (Philosopher_Index) of Fork_Id;

   Column_Width : constant Positive := 24;
   Header_Indent : constant Positive := 12;
   Pipe_Indent   : constant Positive := 16;

   function To_Id (I : Positive) return Character is
   begin
      return Character'Val (Character'Pos ('A') + I - 1);
   end To_Id;

   function Fork_Label (I : Positive) return String is
      Img : constant String := Integer'Image (I);
   begin
      return "F" & Img (Img'First + 1 .. Img'Last);
   end Fork_Label;

   function Ring_Fork_Text (Fork_I : Positive; Count : Positive) return String is
      Left_Phi  : Positive;
      Right_Phi : Positive := Fork_I;
   begin
      if Fork_I = 1 then
         Left_Phi := Count;
      else
         Left_Phi := Fork_I - 1;
      end if;

      return Fork_Label (Fork_I) & " (" & To_Id (Left_Phi) & "-" & To_Id (Right_Phi) & ")";
   end Ring_Fork_Text;

   procedure Put_Padded (S : String; Width : Positive) is
   begin
      if S'Length >= Width then
         Put (S (S'First .. S'First + Width - 1));
      else
         Put (S);
         Put ((1 .. Width - S'Length => ' '));
      end if;
   end Put_Padded;

   function State_Text (S : Philosopher_State) return String is
   begin
      case S is
         when Joined   => return "joined";
         when Waiting  => return "waiting";
         when Eating   => return "eating";
         when Thinking => return "thinking";
      end case;
   end State_Text;

   protected type Table_Printer is
      procedure Init (Count : Positive);
      procedure Set_State (Id : Character; S : Philosopher_State);
      procedure Set_Waiting_For (Id : Character; Fork_Number : Positive);
   private
      Current_Count : Philosopher_Count := 1;
      Initialized   : Boolean := False;
      States        : State_Array := (others => Joined);
      Waiting_For   : Fork_Id_Array := (others => 0);
      procedure Print_Header;
      procedure Print_Snapshot;
      procedure Print_Frame;
   end Table_Printer;

   protected body Table_Printer is
      procedure Init (Count : Positive) is
      begin
         if Count < Philosopher_Count'First then
            return;
         elsif Count > Philosopher_Count'Last then
            Current_Count := Philosopher_Count'Last;
         else
            Current_Count := Philosopher_Count (Count);
         end if;

         Initialized := True;
         States := (others => Joined);
         Waiting_For := (others => 0);

         Put (Character'Val (27) & "[2J");
         Print_Frame;
      end Init;

      procedure Set_State (Id : Character; S : Philosopher_State) is
         I : Integer;
      begin
         if not Initialized then
            return;
         end if;

         I := Character'Pos (Id) - Character'Pos ('A') + 1;
         if I in 1 .. Integer (Current_Count) then
            if States (Philosopher_Index (I)) /= S then
               States (Philosopher_Index (I)) := S;
               Waiting_For (Philosopher_Index (I)) := 0;
               Print_Frame;
            end if;
         end if;
      end Set_State;

      procedure Set_Waiting_For (Id : Character; Fork_Number : Positive) is
         I : Integer;
      begin
         if not Initialized then
            return;
         end if;

         I := Character'Pos (Id) - Character'Pos ('A') + 1;
         if I in 1 .. Integer (Current_Count) then
            States (Philosopher_Index (I)) := Waiting;
            Waiting_For (Philosopher_Index (I)) := Fork_Number;
            Print_Frame;
         end if;
      end Set_Waiting_For;

      procedure Print_Frame is
      begin
         Put (Character'Val (27) & "[H" & Character'Val (27) & "[J");
         Print_Header;
         Print_Snapshot;
         Flush;
      end Print_Frame;

      procedure Print_Header is
      begin
         Put ((1 .. Header_Indent => ' '));
         for I in 1 .. Current_Count loop
            Put_Padded ("Philosopher " & To_Id (Integer (I)), Column_Width);
         end loop;
         New_Line;

         -- Shift forks by half a column so they are visually between philosophers.
         for I in 1 .. Current_Count loop
            Put_Padded (Ring_Fork_Text (Integer (I), Integer (Current_Count)), Column_Width);
         end loop;
         Put_Padded (Ring_Fork_Text (1, Integer (Current_Count)), Column_Width);
         New_Line;

         Put ((1 .. Pipe_Indent => ' '));
         for I in 1 .. Current_Count loop
            Put_Padded ("    |", Column_Width);
         end loop;
         New_Line;
      end Print_Header;

      procedure Print_Snapshot is
         Left_I  : Positive;
         Right_I : Positive;
      begin
         Put ((1 .. Pipe_Indent => ' '));
         for I in 1 .. Current_Count loop
            Put_Padded ("    |", Column_Width);
         end loop;
         New_Line;

         Put ((1 .. Pipe_Indent => ' '));
         for I in 1 .. Current_Count loop
            if States (Philosopher_Index (Integer (I))) = Waiting
              and then Waiting_For (Philosopher_Index (Integer (I))) /= 0
            then
               Put_Padded (
                 "    | waiting (" &
                 Fork_Label (Integer (Waiting_For (Philosopher_Index (Integer (I))))) & ")",
                 Column_Width
               );
            else
               Put_Padded (
                 "    | " & State_Text (States (Philosopher_Index (Integer (I)))),
                 Column_Width
               );
            end if;
         end loop;
         New_Line;

         Put ((1 .. Pipe_Indent => ' '));
         for I in 1 .. Current_Count loop
            if States (Philosopher_Index (Integer (I))) = Eating then
               if Integer (I) = 1 then
                  Left_I := Integer (Current_Count);
               else
                  Left_I := Integer (I) - 1;
               end if;

               if Integer (I) = Integer (Current_Count) then
                  Right_I := 1;
               else
                  Right_I := Integer (I) + 1;
               end if;

               Put_Padded (
                 "    blocking: " & To_Id (Left_I) & ", " & To_Id (Right_I),
                 Column_Width
               );
            else
               Put_Padded ("", Column_Width);
            end if;
         end loop;
         New_Line;
      end Print_Snapshot;
   end Table_Printer;

   Table : Table_Printer;

   random_generator : Random_MS.Generator;

   type p_fork is access fork;

   task type task_philosopher
     (Id       : Character;
      Fork1_Id : Positive;
      Fork2_Id : Positive;
      Cubierto1 : p_fork;
      Cubierto2 : p_fork);

   task body task_philosopher is
      procedure Eat is
         random_ms_value : Duration;
      begin
         Table.Set_Waiting_For (Id, Fork1_Id);
         take_fork (Cubierto1.all);

         Table.Set_Waiting_For (Id, Fork2_Id);
         take_fork (Cubierto2.all);

         Table.Set_State (Id, Eating);
         random_ms_value := Duration (Random_MS.Random (random_generator)) / 1000.0;
         delay random_ms_value;

         release_fork (Cubierto2.all);
         release_fork (Cubierto1.all);

         Table.Set_State (Id, Thinking);
      end Eat;

      procedure Think is
         random_ms_value : Duration;
      begin
         Table.Set_State (Id, Thinking);
         random_ms_value := Duration (Random_MS.Random (random_generator)) / 1000.0;
         delay random_ms_value;
      end Think;
   begin
      Random_MS.Reset (random_generator);
      Table.Set_State (Id, Joined);

      loop
         Eat;
         Think;
      end loop;
   end task_philosopher;

   type PTFilosofo is access task_philosopher;
   fork_number : Positive;
   philosopher_access : PTFilosofo;
   philosopher_name   : Character := 'A';

begin
   Put ("Inser the number of forks: ");
   Get (fork_number);
   New_Line;

   if fork_number > Philosopher_Count'Last then
      Put_Line ("Maximum supported philosophers: " & Integer'Image (Philosopher_Count'Last));
      return;
   end if;

   Table.Init (fork_number);

   declare
      forks_array   : array (1 .. fork_number) of p_fork;
      left_fork_id  : Positive;
      right_fork_id : Positive;
   begin
      for I in 1 .. fork_number loop
         forks_array (I) := new fork;
      end loop;

      for I in 1 .. fork_number loop
         -- Fork naming follows the ring in the header:
         -- F1(E-A), F2(A-B), ..., Fn(previous-last).
         left_fork_id := I;
         if I = fork_number then
            right_fork_id := 1;
         else
            right_fork_id := I + 1;
         end if;

         philosopher_access := new task_philosopher (
            philosopher_name,
            left_fork_id,
            right_fork_id,
            forks_array (left_fork_id),
            forks_array (right_fork_id)
         );

         philosopher_name := Character'Succ (philosopher_name);
      end loop;
   end;

end dining_philosophers;
