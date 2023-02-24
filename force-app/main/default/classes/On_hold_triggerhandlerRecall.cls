public class On_hold_triggerhandlerRecall {
  
    @invocablemethod
    public static void REcall(list<account> acc){
        list<ProcessInstanceWorkitem> Pval = [SELECT Id,ProcessInstance.targetobjectid,ProcessInstance.Status FROM ProcessInstanceWorkItem WHERE ProcessInstance.Status = 'Recall']; 
    if(Pval.size() > 0){
     for(account acc1:acc){
        
         acc1.Name='recall';
             
          /*  Date dToday = Date.today();
            String dateStr = Date.today().format();
            
            Integer dt1 = (acc1.On_Hold_Current_Date__c).daysBetween(Date.valueOf(acc1.submitted_date_for_approval__c));
            
   if(pw.ProcessInstance.targetobjectid==acc1.Id&&acc1.submitted_date_for_approval__c!=null){
    Approval.ProcessWorkItemRequest Preq= new Approval.ProcessWorkItemRequest();
    Preq.setAction('Removed');
    Preq.setWorkItemId(pw.Id);
    Approval.ProcessResult result = Approval.process(Preq);*/
}
}
}
}