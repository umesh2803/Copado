trigger interview_account on Account (before insert) {
    
   list<account> acc=trigger.new;
    
        integer count=[select count() from account];
        if(count==16){
            list<account> acc=[select id ,name from account WHERE name='ravindra'];
            delete acc;
    
        
        
        
        
    }

}