trigger opportunityteam on Opportunity (after insert) {
    
    user u=[select id from user where alias='dwarn'];
    list<opportunityteammember> opt=new list<opportunityteammember>();
    for(opportunity o:trigger.new)
    {
        if(o.Amount>500000)
        {     
            opportunityteammember op=new opportunityteammember();
            op.OpportunityId=o.Id;
            op.UserId=u.id;
            op.TeamMemberRole='account manager';
            op.OpportunityAccessLevel='read';
            opt.add(op);
            
            }
        insert opt;
        
        
        
    }
    
    
    
    

}