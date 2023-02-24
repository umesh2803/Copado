@IsTest
public class test_insert {
    @IsTest
    static void maincal()
    {
       
        insert_account t=new insert_account();
        t.main();
     
        
        account acc=new account();
        acc.Name='brett lee';
        
        insert acc;
    }

  
    }