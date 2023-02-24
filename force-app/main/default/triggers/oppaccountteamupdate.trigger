trigger oppaccountteamupdate on Opportunity (after insert) {
    
    
    list<account> acc=[select id,name from account where name='iron man'];
    list<AccountTeamMember> ateam=[select id from AccountTeamMember where account.name='iron man'];
    
    for(opportunity o:trigger.new)
    {
        for(account a:acc)
        {
            for(AccountTeamMember at:ateam)
            {
                
               
                at.TeamMemberRole='account manager';
                at.CaseAccessLevel='read';
                
            }
        }
        
        
    }update ateam;

}