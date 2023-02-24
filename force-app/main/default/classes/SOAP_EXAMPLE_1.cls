global class SOAP_EXAMPLE_1 {
        
        webservice static SOAP_wrapper_1 createPayment(SOAP_Payment_data reqParams){
        SOAP_wrapper_1 obj=new SOAP_wrapper_1();
            try{
            list<insurance_policy__c> policies=[select id,name from insurance_policy__c WHERE id=:reqParams.insuranceID];
                if(policies.size()==1){
             list<Purchased_Policy_Milestone__c> milstone=[select id from Purchased_Policy_Milestone__c WHERE id=:reqParams.mildstoneID];
                    if(milstone.size()>0){
                        payment__c payment=new payment__c();
                        payment.Insurance_Policy__c=reqParams.insuranceID;
                        payment.Purchased_Policy_Milestone__c=reqParams.mildstoneID;
                        payment.Mode_Of_Payment__c=reqParams.mode;
                        payment.Amount_Paid__c=reqParams.amount;
                        payment.Payment_Date__c=system.today();
                        insert payment;
                        obj.IsSuccess=true;
                        obj.PaymentID=payment.Id;
                    }else{
                 obj.IsSuccess=false;
                 obj.ErrorMSG='no payment mildstone found for requested ID'+reqParams.mildstoneID;
                  }
                }else{
                  obj.IsSuccess=false;
                  obj.ErrorMSG='no purchsed policy are found with passesd ID'+reqParams.insuranceID;
                    }
                
            
            }catch(exception e){
                obj.IsSuccess=false;
                obj.ErrorMSG='Error on Line:'+e.getLineNumber()+':'+e.getMessage();
            }
            return obj;
        
        
    } 


/*global class SOAP_wrapper_1 {
    public boolean IsSuccess ;
    public string ErrorMSG ;
    public ID PaymentID;
    
    public SOAP_wrapper_1()
    {	IsSuccess=false;
        ErrorMSG='NO Error';
        
    }
}*/
}