public class On_hold_triggerhandlerforscheduleTIME {
    @invocablemethod
    public static void scheduletime(list<account> acc){
        List<ProcessInstanceStep> processsteps=[SELECT StepStatus,ProcessInstance.CreatedDate,processinstance.status,processinstance.targetobjectid FROM ProcessInstanceStep where processinstance.status='pending'];
        for(account acc1:acc){
         for(ProcessInstanceStep pr:processsteps){
            if(pr.ProcessInstance.targetobjectid==acc1.Id){
                acc1.submitted_date_for_approval__c=pr.ProcessInstance.CreatedDate;
                
            }
            }
        }
}
}