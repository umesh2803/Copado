public class ON_HOLD_schedule implements schedulable {
    public static void execute(schedulablecontext sc){
    List<account> acc=[select id,Oh_hold_date__c,Active__c from account];
    
   /* List<ProcessInstanceStep> processsteps=[SELECT Actor.userRole.Name, OriginalActor.Name, OriginalActor.Title, StepStatus, 
                                             comments,ProcessInstance.CompletedDate, ElapsedTimeInDays, ElapsedTimeInHours, 
                                             ElapsedTimeInMinutes,ProcessInstance.CreatedDate FROM ProcessInstanceStep where stepstatus='started'  ORDER BY ProcessInstance.CreatedDate desc LIMIT 1];*/
        list<ProcessInstance> Instance=[select id,status,CreatedDate from processInstance where status='pending' ORDER BY CreatedDate desc LIMIT 1];
        for(account acc1:acc){
            for(ProcessInstance prinst:Instance){
                acc1.submitted_date_for_approval__c=prinst.CreatedDate;
            }
        }update acc;
    }


}
//string cronexp ='0 0 0 * * ?';
//system.schedule('hold', cronexp, new ON_HOLD_schedule());