public class YRD_AURA {
    @AuraEnabled
    public static list<account> GetList()
    {	list<account> AccList=new list<account>();
         AccList=[Select Id,name,(Select id FROM Insurance_policy__r) FROM Account WHERE Active__c='yes' AND ID IN (select Account__c FROM INsurance_policy__c)];
        Return AccList; 
    }
    @AuraEnabled
    public static list<Insurance_policy__c> getPolicy(string clientId,Date Fromdate,Date Todate,Boolean FromRecordId){
        list<Insurance_policy__c> insur=new list<Insurance_policy__c>();
        if(FromRecordId){
               insur=[select id,Name,Internal_Wholesaler__r.Employee_Name__c,Policy__r.Name,Account__r.name,Premium__c, Renewal_Term__c,Purchase_Date__c FROM Insurance_policy__c WHERE Account__c=:clientId];
            
        }else{  
            insur=[select id,Name,Internal_Wholesaler__r.Employee_Name__c,Policy__r.Name,Account__r.name,
                                         Premium__c, Renewal_Term__c,Purchase_Date__c FROM Insurance_policy__c
                                        WHERE Account__c=:clientId AND Purchase_Date__c>:Fromdate AND Purchase_Date__c <: Todate];
            
        }        
        
        
        		return insur;
        
    }
    @AuraEnabled
    public static integer gettotalpolicy(string Accountid)
    {
        integer count=[select count() from Insurance_Policy__c WHERE Account__c=:Accountid];
        return count;
    }
     @AuraEnabled
        public static list<Purchased_Policy_Milestone__c> getmilestone(string policyid,integer premium,string renewal){
            list<Purchased_Policy_Milestone__c> pmlist=new list<Purchased_Policy_Milestone__c>();
            Purchased_Policy_Milestone__c pm=new Purchased_Policy_Milestone__c();
            pm.Premium__c=premium;
            pm.Payment_Status__c='Realised';
            pm.Name='Intial payment';
            pm.Payment_Date__c=system.today();
            pmlist.add(pm);

            Policy__c poly=[select id,Name,Total_cost_of_Premium__c,Start_Date__c,Renewal_Term__c,Initial_Premium__c,End_Date__c FROM Policy__c WHERE id=:policyid];
           
            integer totalmonth=poly.Start_Date__c.monthsBetween(poly.End_Date__c);
            decimal pendingdues=poly.Total_cost_of_Premium__c - premium;
            integer dividedbyduration = renewal == 'Monthly' ? 1 : renewal == 'Quarterly' ? 3 : renewal == 'Bi-Yearly' ? 6 : 12 ;
            integer durationrenewal=integer.valueOf(totalmonth/dividedbyduration);
            decimal totalinstallment = pendingdues/durationrenewal ;

            Date paymentdate=system.today().addMonths(dividedbyduration);
            for(integer i=0;i<durationrenewal;i++)
            {Purchased_Policy_Milestone__c pmfor=new Purchased_Policy_Milestone__c();
                pmfor.Name='Installment-'+(i+1);
                pmfor.Premium__c=totalinstallment;
                pmfor.Payment_Status__c='Due';
                pmfor.Payment_Date__c =paymentdate;
                pmlist.add(pmfor);
                paymentdate=system.today().addMonths(dividedbyduration);
            }
           
            return pmlist;
        }
        @AuraEnabled
        public static void milestoneinsert(string policyid,integer premium,string renewal,string insuranceid){
            try {
                list<Purchased_Policy_Milestone__c> pmlist=getmilestone(policyid,premium,renewal);
                for(Purchased_Policy_Milestone__c mili:pmlist){
                    mili.Insurance_policy__c=insuranceid;
                }
                insert pmlist;
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

}