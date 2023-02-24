public class querydelete {
    
    public void main()
    {
      list<contact> con=[select name,account.id from contact where account.id=null];
        
        delete con;
      
        
        
        
        
    }

}









 /* list<Transaction__c> tran=[select id,name from Transaction__c WHERE createddate=last_week];
        
        Delete tran;*/