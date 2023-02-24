public class accountinsert {
    
    public accountinsert()
    {
        
       list<account> acc=[select id,name from account];
        system.debug(acc);
    }

}