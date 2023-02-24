trigger amount_opportunity_dynamic on Opportunity (after insert) {
    
    map<id,list<opportunity>> accmap=new map<id,list<opportunity>>();
    
    for(opportunity op:trigger.new){
        
        if(!accmap.containsKey(op.AccountId)){
            accmap.put(op.AccountId,new list<opportunity>());
        }
            list<opportunity> op123=accmap.get(op.AccountId);
            op123.add(op);
            accmap.put(op.AccountId, op123);
           
      }
        
        list<account> acc=[select id,name,total_amount__c from account where id IN :accmap.keySet()];
       
        for(account acc1:acc){
             list<opportunity> opop=[select id,amount,accountid from opportunity where accountid IN :accmap.keySet()];
            decimal total=0;
            for(opportunity op12:opop){
                
                
                total +=op12.amount;
                
                
            }
            acc1.total_amount__c=total;
        }  
    update acc;   
    

}