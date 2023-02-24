trigger emailduplead on Lead (before insert,before update) {
    
        list<lead> leads =new list<lead>();
   
    for(lead l:trigger.new)
    {
         list<lead> con=[select id,name,email,Contact__r.email from lead where email=:l.Email OR contact__r.email=:l.Email];
         if(con.size()>0)
         {
             
             l.Email.addError('duplicate email');
             }
    }
             
             
             
        
        
        
        
        
    


}