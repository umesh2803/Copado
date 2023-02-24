trigger deletecustomer on customer__c (after delete) {
    
list<customer__c> cust=trigger.old;  
   
   list<test__c> tests=[select id,name from test__c where customer__c NOT IN :cust];
   delete tests;


       
        
            
            
        
        
        
    

}