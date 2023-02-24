trigger On_hold_approve on Account (before update) {
   
    
    list<ProcessInstanceWorkitem> Pval = [SELECT Id,ProcessInstance.targetobjectid,ProcessInstance.Status FROM ProcessInstanceWorkItem WHERE ProcessInstance.Status = 'Pending']; 
    if(Pval.size() > 0){
     for(account acc1:trigger.new){
         for(ProcessInstanceWorkitem pw:pval){
             if(pw.ProcessInstance.targetobjectid==acc1.Id&&acc1.submitted_date_for_approval__c!=null){
    Approval.ProcessWorkItemRequest Preq= new Approval.ProcessWorkItemRequest();
    Preq.setAction('Removed');
    Preq.setWorkItemId(pw.Id);
    Approval.ProcessResult result = Approval.process(Preq);
}
}
}
}
}