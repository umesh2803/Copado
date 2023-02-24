trigger tiggerfor_duplicate on Account (before insert) {
    
    
    for(account a:trigger.new)
    { list<account> acc=[select id,name from account where name=:a.name];
   
      if(acc.size()>0)
     {
        a.name.addError('account name is already exits');                   }
    }               
    
}







 /*for(account a:trigger.new)
    { list<account> acc=[select id,name from account where name=:a.name];
    
     a.name.addError('account name is already exits');                  }
                    
   
}*/