trigger oldvalueupdate on customer__c (after update) {
    
   
   
    
    for(customer__c c :trigger.new)
    {
        
        list<test__c> test1=[select id ,name,balance__c from test__c where customer__c=:c.Id];
        for(test__c t:test1)
           {
               t.Name=c.name;
           
               t.balance__c=c.balance__c;
            
        
            }  update test1;
    }
        

}