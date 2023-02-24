public class ConfigureActiveClient {
   
    @AuraEnabled
    public static ClientsWrapper getClient(){
        ClientsWrapper clw=new ClientsWrapper();
        clw.Acclist=[select Id,Name from account where Active__c='yes'];
        clw.polylist=[select Id,Name from Policy__c where Active__c=true];
        return clw;
    }
    
    public class ClientsWrapper{
	
    @AuraEnabled public List<account> Acclist;
    @AuraEnabled public List<Policy__c> polylist;
        public ClientsWrapper(){
            Acclist=new List<account>();
            polylist=new List<Policy__c>();
            
        } 
        
    
    }
    

}