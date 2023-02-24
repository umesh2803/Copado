trigger sales_rep on Account (before insert) {
  
    for(account acc:trigger.new)
    {   
        
   
        account a=new account();
        a.name=acc.name;

    }
    
    
    }