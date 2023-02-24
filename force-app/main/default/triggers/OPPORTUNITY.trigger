trigger OPPORTUNITY on Opportunity (after insert,after update) {
    
    list<opportunity> op=new list<opportunity>();
    
    for(opportunity o:trigger.new)
        if(o.stagename!='prospecting')
    {
        opportunity op1=new opportunity();
        op1.Id=o.Id;
        op1.StageName='prospecting';
        op1.CloseDate=system.today()+15;
        op1.Type='new customer';
        op.add(op1);
          
    }update op;
    
        
        
    

}