public class practice {
    
    public void main()
    {
       /* opportunity op=[select id,account.id ,name from opportunity where account.name='umesh1'];
        opportunity op1=[select id,account.id,name from opportunity where account.name='umesh2'];
        op.AccountId=op1.AccountId;
        update op;*/
       account acc=[select id from account where name='umesh1'] ;
       account acc1=[select id from account where name ='umesh2'];
       list<opportunity> op=[select id,name,AccountID from opportunity where AccountID =:acc.Id];
       for(opportunity p:op)
        {
            p.AccountID=acc1.id; 
            
        }
        
    }

}