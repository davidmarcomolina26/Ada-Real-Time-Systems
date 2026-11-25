 package forks is

    type fork is limited private;
    
    procedure take_fork(parameter: in out fork);
    procedure release_fork(parameter: in out fork);

 private
    
    type type_status is (FREE, OCCUPIED);
    
    protected type fork(fork_status: type_status := FREE) is
       entry take_fork_entry;
       entry release_fork_entry;
    private
      
       status: type_status := fork_status;
    end fork;
    
 end forks;
