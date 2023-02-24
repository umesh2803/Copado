trigger triggeronlead on Lead (before insert) {
    
    for(lead l:trigger.new)
    {
    if(l.leadsource=='hot')
    {
        l.result__c=l.LeadSource;
        
    }else if(l.leadsource=='web')
    {
        l.result__c=l.LeadSource;
    }
        else  {
            l.result__c=l.LeadSource;
        }  
    
    }

}