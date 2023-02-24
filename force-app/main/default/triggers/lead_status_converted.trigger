trigger lead_status_converted on Lead (after update) {
    for(lead l:trigger.new)
    {
        if(trigger.isafter&&trigger.isupdate){
        if(l.Status=='converted'){
            account acc=new account();
            acc.Name=l.company;
            acc.Email__c=l.Email;
            insert acc;
            contact con=new contact();
            con.LastName=l.LastName;
            con.Email=l.Email;
            insert con;
            
        }   
        }
    }
        
 
}