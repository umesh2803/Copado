trigger tiggerrelation_delete on Account (before insert,after insert) {
    
    for(account a:trigger.new)
    {
        list<account> acc=[select id,name from account where name=:a.name];
        
       
        if(trigger.isinsert)
        {
          list<contact> con=[select account.name from contact where account.name=:a.Name];
            delete con;
            
        }
       
                         }
       
       
    
    
    }