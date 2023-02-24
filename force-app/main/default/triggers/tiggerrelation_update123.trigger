trigger tiggerrelation_update123 on Transaction__c (after insert) {
    
    
    for(transaction__c t:trigger.new)
    {
        
        list<customer__c> cust=[select id,name from customer__c where customer__c.id=:t.customer__r.id ];
        for(customer__c c:cust) 
        if(t.Transaction_type__c=='deposit')
        {
            
			c.balance__c=c.balance__c + t.amount__c;           
            
        }else{
            	c.balance__c=c.balance__c - t.amount__c;
        }
            
        
        
        
   update cust; }
  
  
    
            
       





}