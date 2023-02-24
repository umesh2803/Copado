trigger testupdate_object on Test__c (before insert,before update) {
    
    for(test__c t1:trigger.new){
        
        if(t1.account_type__c=='saving')
        {
            t1.Lead_Source__c='other';
        }
    }

}