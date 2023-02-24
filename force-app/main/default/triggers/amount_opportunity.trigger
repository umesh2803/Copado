trigger amount_opportunity on Opportunity (after insert) {
    decimal total=0;
    list<account> acc=[select id,total_amount__c from account where name='disney'];
    for(opportunity op:trigger.new){
      // list<opportunity> opp=[select id,name,Amount from opportunity where AccountId=:acc.id];
        for(account acc1:acc){
        for(opportunity ops:[select id,name,Amount from opportunity where AccountId =:acc1.id]){
            
            ops.amount=ops.amount+total;
            total=ops.amount;
        }
       acc1.total_amount__c=total;
     }
    
    }
    
    update acc;
}