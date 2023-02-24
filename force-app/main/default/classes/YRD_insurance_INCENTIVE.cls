public class YRD_insurance_INCENTIVE implements Database.Batchable<Sobject>,database.stateful{
    public integer incentiveRecordCreatedCount =0;
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
     
     	map<string,Incentive_Rate_By_City__mdt> cityincentiveMdtmap = new map<string,Incentive_Rate_By_City__mdt>();
        map<string,Wholesaler_Incentive_Base__c> incentivealowMap=Wholesaler_Incentive_Base__c.getall();
        list<Incentive_Rate_By_City__mdt> cityIncentivemdtList=[SELECT id,DeveloperName,city__c,Incentive_Percentage__c,End_Date__c,Start_Date__c FROM Incentive_Rate_By_City__mdt WHERE Start_Date__c <=LAST_MONTH AND End_Date__c >= THIS_MONTH];
     	for(Incentive_Rate_By_City__mdt mdtobj:cityIncentivemdtList)
        {
           cityincentiveMdtmap.put(mdtobj.DeveloperName, mdtobj); 
        }
     	for(ID wholesalerID:wholesalerpolicymap.keySet())
        {
            for(string city:wholesalerpolicymap.get(wholesalerID).keyset())
            {	 string customkey=city + '_metrics';
                if(incentivealowMap.containskey(city) && incentivealowMap.get(city).Incentive_calculation_Allowed__c && cityincentiveMdtmap.containskey(customkey))
                { decimal totalpremiumsold=0;
                for(insurance_policy__c policies: wholesalerpolicymap.get(wholesalerID).get(city))
                {
                    totalpremiumsold += policies.premium__c;
                }
        Production_Incentive_Calculation__c objPic=new Production_Incentive_Calculation__c();
     	
     	objPic.city__c=city;
        objPic.Incentive_Percentage__c=cityincentiveMdtmap.get(customkey).Incentive_Percentage__c;
     	objPic.Total_Sales__c= totalpremiumsold;
        objPic.Internal_Wholesaler__c=wholesalerID;
        objPic.Month__c=Datetime.now().addmonths(-1).format('MMMM');
        objPic.Year__c=date.today().addmonths(-1).year();
       
     	insertPIClist.add(objPic);
                    }
            }
        }if(insertPIClist.size()>0)
         {insert insertPIClist;
          incentiveRecordCreatedCount+=insertPIClist.size();}        
     
        
    }
    public void finish(Database.BatchableContext btContext)
    {
     messaging.SingleEmailMessage sendemailobj=new messaging.SingleEmailMessage();
     list<string> toaddresses=new list<string>();
     toaddresses.add('umeshrathodbe@gmail.com');
     sendemailobj.setToAddresses(toaddresses);
     sendemailobj.subject='Compensation Calculation Completed for Last Month';
     sendemailobj.htmlbody='<body><P>Hi All</p>';
     sendemailobj.htmlbody +='<p style="color:green;">The batch calculation for Incentive Compensation is completed just now.<br/><br/> Please go ahead and start disbursing the Incentives</p>';   
     sendemailobj.htmlbody += '<p><b>Total Incentives Calculated:'+incentiveRecordCreatedCount+' </b></p>';
     sendemailobj.htmlbody += '</body>';
     list<messaging.SingleEmailMessage> sendemaillist=new list<messaging.SingleEmailMessage>(); 
     sendemaillist.add(sendemailobj);                  
     messaging.sendEmail(sendemaillist);              
                        
     }

}