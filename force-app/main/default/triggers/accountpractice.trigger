trigger accountpractice on Account (after update) {
    
    
    user ur=[select id,name from user where alias='urath'];
        list<task> taskassign=new list<task>();
        for(account a:trigger.new)
        {
            
            
            if(a.industry=='Education'&&trigger.oldmap.get(a.id).industry=='banking')
            {
                task t=new task();
                t.Subject='call';
                t.OwnerId=ur.id;
                t.WhatId=a.id;
                t.Status='completed';
                t.Priority='normal';
                taskassign.add(t);
            
            }
            
            
        }insert taskassign;
    
}