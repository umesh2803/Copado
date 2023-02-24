@isTest
public class Test_account_1 {
    
	@isTest
    static void show()
    {
        T_Account_1 t=new T_Account_1();
        t.main();
        integer count=[select count()from account];	
        system.assertEquals(2, count);
      
        
        
        
        
    }
      
}   /*integer count=[select count()from account where name='jumbo2'];*/