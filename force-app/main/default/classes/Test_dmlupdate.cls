@isTest
public class Test_dmlupdate {
   
     @isTest
    static void maincal()
    {
        
        contact ce=new contact();
        ce.LastName='test';
        ce.Phone='1200';
        insert ce;
        
        dmlupdate dm=new dmlupdate();
        dm.main();
        
        contact con=[select id,name,phone from contact];
        
        con.phone='12300000';
        
        update con;
        
        
        
       
      
        
        
            
        
        }       
        
            
        
    }