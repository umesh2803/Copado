global class YRDpractice {
    @AuraEnabled
    public static list<account> getAccount(){
        
        list<account> acc=[select id,name,(select id,name from insurance_policy__r) from account where id IN (select account__c from insurance_policy__c)];
   		return acc;
    }
    
    @AuraEnabled
    public static list<insurance_policy__c> getpolicy(string AccountID){
        
        list<insurance_policy__c> policies=[select id,Name,account__r.Name from insurance_policy__c where Account__c =:AccountID];
        
        return policies;
        
       
    }
    
    
    
    
    
    
    
    /* public static wrapperaccount getAccount(){
        wrapperaccount clw=new wrapperaccount();
        clw.acclist=[select id,Name,(select id,Name from insurance_policy__r) from account where id IN (select account__c from insurance_policy__c)];
   		return clw;
    }
    
    public class wrapperaccount{
      @AuraEnabled public list<account> acclist;  
        
            public wrapperaccount(){
            acclist=new list<account>();
        }
        
    }*/

}