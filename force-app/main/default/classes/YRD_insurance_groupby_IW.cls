public class YRD_insurance_groupby_IW {
   
  
     
    public void start()
    {  list<Insurance_Policy__c> insuranceLIST = [SELECT id,Internal_Wholesaler__c,account__r.billingcity,Policy__c,Premium__c FROM Insurance_Policy__c WHERE Premium__c > 0];
       map<ID,map<string,list<Insurance_Policy__c>>> policyMap=new map<ID,map<string,list<Insurance_Policy__c>>>();
       map<string,list<Insurance_Policy__c>> cityPolicyMap=new map<string,list<Insurance_Policy__c>>();
     
     for(Insurance_Policy__c Ipobj:insuranceLIST)
     {
          cityPolicyMap=policyMap.get(IPobj.policy__c); 
        
          policyMap.put(Ipobj.policy__c,cityPolicyMap);
    }    system.debug('SHow'+cityPolicyMap);	
         system.debug('SHow'+policymap); 
    }
}