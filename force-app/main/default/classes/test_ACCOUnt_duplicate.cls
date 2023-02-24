@isTest
public class test_ACCOUnt_duplicate {
    @isTest
    static void main()
    {
    account acc=new account();
        acc.Name='xyz';
        insert acc;
        
    account acc1=new account();
        acc1.Name='xyz';
        insert acc1;
        
    list<account> aac2=[select id ,name from account];
        
    integer count=[select count()from account where name=:acc1.Name];
    
    if(count>0)
    {
        acc1.Name.addError('account name is already exits');
        
    }
     
   
       
        
        
        
        

    }

}