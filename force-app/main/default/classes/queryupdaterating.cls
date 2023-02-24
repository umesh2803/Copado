public class queryupdaterating {
    
    public void main()
    {
        list<account> acc=[select id,name,rating from account];
        
        for(account a:acc)
        {
           a.rating='hot';
            
            
        }update acc;
        

        
        
        
    }

}