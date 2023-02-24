public class batch_YRD_insurance implements Database.Batchable<Sobject>,Database.stateful {
    public void main(){
        system.debug('Hello world');
    }
    public integer incentiveRecordCreatedCount=0;
    public Database.QueryLocator start(Database.BatchableContext btContext) {
        //Pre Batch Processing Data extracting
        String query = 'SELECT Id, Internal_Wholesaler__c, Account__r.BillingCity, Premium__c FROM Insurance_Policy__c';
        query += ' WHERE Purchase_Date__c = LAST_MONTH AND Premium__c > 0';
        return Database.getQueryLocator(query);
        //It will fetch all records 20M    200 | 200 | 200
    }

    public void execute(Database.BatchableContext btContext,list<Insurance_Policy__c> insuranceLIST)
    {	list<Production_Incentive_Calculation__c> insertPIClist=new list<Production_Incentive_Calculation__c>();
      map<ID,map<string,list<Insurance_Policy__c>>> wholesalerpolicymap=new map<ID,map<string,list<Insurance_Policy__c>>>();
        for(Insurance_Policy__c IPobj:insuranceLIST)
        {	map<string,list<insurance_policy__c>> citypolicymap =new map<string,list<insurance_policy__c>>();
         	
             if(wholesalerpolicymap.containsKey(IPobj.Internal_Wholesaler__c)) 
            {  citypolicymap = wholesalerpolicymap.get(IPobj.Internal_Wholesaler__c);
                if(citypolicymap.containsKey(IPobj.account__r.billingcity))     
                {	
                    list<insurance_policy__c> policylist=citypolicymap.get(IPobj.account__r.billingcity);  //{1}
                    policylist.add(IPobj);					
                    citypolicymap.put(IPobj.account__r.billingcity, policylist);
                }else{
                    citypolicymap.put(IPobj.account__r.billingcity, new list<Insurance_Policy__c>{IPobj});
                }
             wholesalerpolicymap.put(IPobj.Internal_Wholesaler__c, citypolicymap);
           
            }else{ citypolicymap.put(IPobj.account__r.billingcity, new list<Insurance_Policy__c>{IPobj});
                   wholesalerpolicymap.put(IPobj.Internal_Wholesaler__c, citypolicymap);}
        }
     
     	//map<string,Incentive_Rate_By_City__mdt> cityincentiveMdtmap = new map<string,Incentive_Rate_By_City__mdt>();
     map<string,Incentive_Rate_By_City__mdt> cityincentiveMdtmap= Incentive_Rate_By_City__mdt.getall(); 
     map<string,Wholesaler_Incentive_Base__c> incentivealowMap=Wholesaler_Incentive_Base__c.getall();
       /* list<Incentive_Rate_By_City__mdt> cityIncentivemdtList=[SELECT id,DeveloperName,city__c,Incentive_Percentage__c,End_Date__c,Start_Date__c FROM Incentive_Rate_By_City__mdt WHERE Start_Date__c <=LAST_MONTH AND End_Date__c >= THIS_MONTH];
     	for(Incentive_Rate_By_City__mdt mdtobj:cityIncentivemdtList)
        {
           cityincentiveMdtmap.put(mdtobj.DeveloperName, mdtobj); 
        }*/
     	for(ID wholesalerID:wholesalerpolicymap.keySet())
        {
            for(string city:wholesalerpolicymap.get(wholesalerID).keyset()){
          if(incentivealowMap.containsKey(city)&&incentivealowMap.get(city).Incentive_calculation_Allowed__c&&cityincentiveMdtmap.containsKey(city)){
                decimal totalpremium =0;
              for(Insurance_Policy__c policies:wholesalerpolicymap.get(wholesalerID).get(city)){
                  totalpremium+=policies.premium__c;
              }
              Production_Incentive_Calculation__c objPic=new Production_Incentive_Calculation__c();
     	
     	objPic.city__c=city;
        objPic.Incentive_Percentage__c=cityincentiveMdtmap.get(city).Incentive_Percentage__c;
     	objPic.Total_Sales__c= totalpremium;
        objPic.Internal_Wholesaler__c=wholesalerID;
        objPic.Month__c=Datetime.now().addmonths(-1).format('MMMM');
        objPic.Year__c=date.today().addmonths(-1).year();
       
     	insertPIClist.add(objPic);  
          
    } 
      }
        }if(insertPIClist.size()>0)
         {insert insertPIClist;
          incentiveRecordCreatedCount+=insertPIClist.size();}        
  
    }public void finish(Database.BatchableContext contextBT){
        
    }
}