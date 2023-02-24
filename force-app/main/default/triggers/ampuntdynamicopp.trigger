trigger ampuntdynamicopp on Opportunity (after insert) {
    
   decimal total=0;
    for(opportunity op:trigger.new){
       
        list<account> acc=[select id,name,total_amount__c from account where id=:op.AccountId];
        
        for(account ac1:acc){
            
            list<opportunity> op12=[select id,amount,accountid from opportunity where accountID=:ac1.Id];
            for(opportunity op34:op12){
               
                total +=op34.amount;
            }
            
            ac1.total_amount__c=total;
        }
             update acc;        
    }

}