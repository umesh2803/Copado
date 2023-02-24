trigger oldvalue on customer__c (after update) {
    
    list<test__c> titu=new list<test__c>();
    for(customer__c c:trigger.old)
    {
        test__c t=new test__c();
        t.customer__c=c.Id;
        t.Name=c.Name;
        t.balance__c=c.balance__c;
        
        titu.add(t);
    
    
    }insert titu;
    
    
    
    

}