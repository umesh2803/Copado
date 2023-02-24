public class allActiveClientsList {
    public list<cityAccountMetadataWrapper> clientdatawrapper{set;get;}
    
   public allActiveClientsList()
   {
       clientdatawrapper=new list<cityAccountMetadataWrapper>();
       map<string,list<account>> clientsBycitymap=new map<string,list<account>>();
       list<account> activeClientsList=[select id,Billingcity,name,type,website,AccountNumber,owner.name from account where Active__c='yes'];
       
       for(account accObj : activeClientsList)
       {
           if(clientsBycitymap.containskey(accObj.BillingCity))
           {
               
               
               
           }
           
           
       }
       
       
       
   }
    
    

}