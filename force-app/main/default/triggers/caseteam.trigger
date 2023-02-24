trigger caseteam on Case (after insert) {
    
    user u=[select id from user where alias = 'dwarn'];
    caseTeamRole T=[select id from caseTeamRole where name='avenger'];    
    list<caseTeamMember> ctt=new list<caseTeamMember>();
    for(case c:trigger.new)
    {
        if(c.origin=='web')
        {
            caseTeamMember ct1=new caseTeamMember();
            ct1.ParentId=c.Id;
            ct1.MemberId=u.Id;
            ct1.TeamRoleId=T.id;
          
           
            ctt.add(ct1);
            
        }insert ctt;
        
        
    }
    

}