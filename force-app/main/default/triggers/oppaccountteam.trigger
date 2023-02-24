trigger oppaccountteam on Opportunity (after insert) {
    
    list<account> acc=[select id,name from account where name='iron man'];
    list<AccountTeamMember> accteam=new list<AccountTeamMember>();
    
    for(opportunity o:trigger.new)
    {
        if(o.Probability==50){
            for(account a:acc){
            AccountTeamMember AT=new AccountTeamMember();
            AT.accountid=a.Id;
            AT.userid=o.ownerid;
            
            accteam.add(AT);
                       
            
            
            
        } 

        }
        
        
        
    }insert accteam;

}