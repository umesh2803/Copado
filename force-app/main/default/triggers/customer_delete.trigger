trigger customer_delete on customer__c (before insert) {
    list<customer__c> cust=trigger.new;
    
    integer count=[select count() from customer__c];
    if(count==2)
    {
        list<customer__c> customerDEL=[select id,name from customer__c limit 1];
        delete customerDEL; 
        
    }

}