trigger insurance_policy on Insurance_Policy__c (before insert,after insert) {
    
    for(Insurance_Policy__c ip:trigger.new){
        
        list<Insurance_Policy__c> ipobj=[select id,name,Premium__c from Insurance_Policy__c];
        
        for(Insurance_Policy__c ip1:ipobj){
            ip1.Premium__c=5200;
        }
        update ipobj;
    }
    

}