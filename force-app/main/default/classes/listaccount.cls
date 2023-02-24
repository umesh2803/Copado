public class listaccount {
    list<Account> acc=new list<Account>();
    
    public void newaccount()
    {
        Account a1=new Account();
        a1.Name='testpotato';
        a1.Industry='Banking';
        a1.Rating='Hot';
        a1.Description='new account';
      
        Account a2=new Account(Name='test2potato',Industry='Chemical',Rating='cold',Description='new account',Ownership='Public');
        
        acc.add(a1);
        acc.add(a2);
        
        system.debug('new accounts--'+acc);
     
        insert acc;
        
        
    } 

}