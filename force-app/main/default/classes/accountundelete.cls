public class accountundelete {
    
    public void main()
    {
        list<account> acc=[select id,name from account where isdeleted=true all rows];
        undelete acc;
        system.debug('undeleted account='+acc);
        
        
        
    }

}