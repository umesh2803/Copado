trigger owneridcase on Case (after update) {
    
    list<case> cs=[select id,ownerid,status,origin,createdbyid from case where ownerid='0055g00000D3Qf2AAF'];
    
    for(case c:trigger.new)
    {
        
        /*case c1=new case();
        c1.Id=c.Id;
        c1.Status=c.Status;
        c1.Origin=c.Origin;
        c1.OwnerId=c.CreatedById;
        cases.add(c1);*/
        
        for(case c1:cs)
        {
           c1.Id=c.Id;
         c1.OwnerId=c.CreatedById;
          c1.Status=c.Status;
            c1.Origin=c.Origin;
       

        
        }
        
        
        
    }update cs;
    
    
    
    
    
    

}