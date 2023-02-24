public class dmlupdate2 {
    
    public void main()
    {
        list<account> acc=[select id,name,phone,(select id,name from contacts) from account where name='samrat3'];
        list<contact> con=[select id,name from contact where account.name='samrat3'];
        
        for(contact c1:con)
        {
            c1.phone='000000000';
            update c1;
            
        }
        
        
        
    }

}