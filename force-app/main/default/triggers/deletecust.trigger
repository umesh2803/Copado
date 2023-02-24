trigger deletecust on customer__c (before delete) {
   
list<customer__c> cust=trigger.old;
    list<test__c> t=[select id from test__c where customer__c IN :cust];
    delete t;
    
    
    

}