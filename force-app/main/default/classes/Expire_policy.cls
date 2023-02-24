public class Expire_policy implements Database.Batchable<Sobject>,database.stateful {
    public Database.QueryLocator start(Database.BatchableContext contextBT){
        string query = 'SELECT id,Name,Active__c,End_Date__c FROM Policy__c WHERE End_Date__c=yesterday';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext contextBT,list<Policy__c> policyLIST){
        for(Policy__c IP:policyLIST){
            IP.Active__c=false;
            update IP;
         }
        
        
    }
    public void finish(Database.BatchableContext btContext){
       list<policy__c> expirepolicy=[select id,name,End_Date__c,Renewal_Term__c,Total_Cost_of_Premium__c from policy__c where End_Date__c=today];
        messaging.SingleEmailMessage Emailtosend=new messaging.SingleEmailMessage();
        list<string> Toaddress=new list<string>();
        Toaddress.add('umeshrathodbe@gmail.com');
        Emailtosend.setToAddresses(Toaddress);
        Emailtosend.subject='policies are expiring today';
        Emailtosend.htmlbody = '<body><p>Hi All,</p>';
         for(Policy__c policy: expirepolicy) {
            Emailtosend.htmlbody += '<tr><td>'+policy.Name+'</td><td>'+policy.Renewal_Term__c+'</td><td>'+policy.Total_Cost_of_Premium__c+'</td><tr/>';
        }
        list<messaging.SingleEmailMessage> singlemsglist=new list<messaging.SingleEmailMessage>();
        singlemsglist.add(Emailtosend);
        
        messaging.sendEmail(singlemsglist);
        
       // system.enqueueJob(new queueable_expire_policy());//IT calls queueable method to avoid DML ERROR.
			
    }

}