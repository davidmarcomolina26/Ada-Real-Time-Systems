package body forks is

   procedure take_fork (parameter: in out fork) is
   begin
      parameter.take_fork_entry;
   end take_fork;

   procedure release_fork (parameter: in out fork) is
   begin
      parameter.release_fork_entry;
   end release_fork;

   protected body fork is

      entry take_fork_entry when status = FREE is
      begin
         status := OCCUPIED;
      end take_fork_entry;


      entry release_fork_entry when status = OCCUPIED is
      begin
         status := FREE;
      end release_fork_entry;

   end fork;

end forks; 
