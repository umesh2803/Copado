public class querynameupdate {
    
    public void main()
    {
        list<account> acc=[select id,name from account WHERE name like 'umesh%'];
        integer i=1;
        for(account a:acc)
        {
            a.name='umesh'+i;
            i++;
            
        }update acc;
          
        
    }

}























 /*integer i=1;
           string umesh;
        
            for(account a:acc)
            {
                a.name='umesh'+i;
                i++;
            }
            
            update acc;*/