public class Uniform_filteroption {
    @AuraEnabled
    public static filterWrapper getfilter(){
       filterWrapper fw=new filterWrapper();
       fw.acclist=[select id,Name from Account WHERE Active__c='yes'];
       fw.policylist=[select id,Name from Policy__c WHERE Active__c=true];
       return fw;
        
    }



public class filterWrapper{
  @AuraEnabled public List<account> acclist; 
  @AuraEnabled public List<Policy__c> policylist; 
    
    public filterWrapper(){
        acclist=new List<account>();
        policylist=new List<policy__c>();
    }
}
}