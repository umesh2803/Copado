trigger EmailTOspeaker on Session_Speaker__c (after insert) {
    
    for(Session_Speaker__c SC:trigger.new)
    {
        Session_Speaker__c sessionspeaker=[select id,Session__r.Name,Session__r.Session_Date__c, Speaker__r.First_Name__c,Speaker__r.Last_Name__c,Speaker__r.Email__c FROM Session_Speaker__c
                                           WHERE id=:SC.id];
        
     if(sessionspeaker.Speaker__r.Email__c!=null){
     messaging.SingleEmailMessage sendemailobj=new messaging.SingleEmailMessage();
     list<string> toaddresses=new list<string>();
     toaddresses.add('umeshrathodbe@gmail.com');
     sendemailobj.setToAddresses(toaddresses);
     sendemailobj.subject='confirmation';
     sendemailobj.htmlbody='<body><P>Hi All</p>';
     list<messaging.SingleEmailMessage> sendemaillist=new list<messaging.SingleEmailMessage>(); 
     sendemaillist.add(sendemailobj);                  
     messaging.sendEmail(sendemaillist);  
            }
        
        
        
    }

}