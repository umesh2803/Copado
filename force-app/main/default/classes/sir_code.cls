public class sir_code implements Database.Batchable<Sobject>, Database.stateful  {
    public Integer incentiveRecordCreatedCount = 0;

    public Database.QueryLocator start(Database.BatchableContext btContext) {
        //Pre Batch Processing Data extracting
        String query = 'SELECT Id, Internal_Wholesaler__c, Account__r.BillingCity, Premium__c FROM Insurance_Policy__c';
        query += ' WHERE Purchase_Date__c = LAST_MONTH AND Premium__c > 0';
        return Database.getQueryLocator(query);
        //It will fetch all records 20M    200 | 200 | 200
    }

    public void execute(Database.BatchableContext btContext, List<Insurance_Policy__c> insuranceList) {
        //Actual Data Processing
        List<Production_Incentive_Calculation__c> insertPICList = new List<Production_Incentive_Calculation__c>();
        Map<Id, Map<String, List<Insurance_Policy__c>>> wholesalerpolicyMap = new Map<Id, Map<String, List<Insurance_Policy__c>>>();
       // Ankit | 1(Mumbai), 2(Pune), 3(Mumbai), 4(Sangli)
       // Zaid  | 1(Sangli), 2(Akola)

        for( Insurance_Policy__c IPobj: insuranceList) {
            Map<String, List<Insurance_Policy__c>> cityPolicyMap = new Map<String, List<Insurance_Policy__c>>();
            if(wholesalerpolicyMap.containsKey(IPobj.Internal_Wholesaler__c)) {
                cityPolicyMap = wholesalerpolicyMap.get(IPobj.Internal_Wholesaler__c);//["Mumbai": {1}, "Pune": {2}]

                if(cityPolicyMap.containsKey(IPobj.Account__r.BillingCity)) {
                    List<Insurance_Policy__c> policyList = cityPolicyMap.get(IPobj.Account__r.BillingCity);//{1}
                    policyList.add(IPobj);//{1, 3}

                    cityPolicyMap.put(IPobj.Account__r.BillingCity, policyList);//"Mumbai": {1, 3}
                } else {
                    cityPolicyMap.put(IPobj.Account__r.BillingCity, new List<Insurance_Policy__c>{IPobj});//["Mumbai": {1}, "Pune": {2}]
                }

                wholesalerpolicyMap.put(IPobj.Internal_Wholesaler__c, cityPolicyMap);
            } else {
                cityPolicyMap.put(IPobj.Account__r.BillingCity, new List<Insurance_Policy__c>{IPobj});//["Mumbai": {1}]
                wholesalerpolicyMap.put(IPobj.Internal_Wholesaler__c, cityPolicyMap);//"AnkitRecordId": ["Mumbai": {1}]
            }
        }
		 Map<String, Incentive_Rate_by_City__mdt> cityIncentiveMdtMap = Incentive_Rate_by_City__mdt.getAll(); 
        //Map<String, Incentive_Rate_by_City__mdt> cityIncentiveMdtMap = new Map<String, Incentive_Rate_by_City__mdt>(); if incentive_rate_city name is noraml as city then no need to use this statement 
        																												//but if incentive_rate_city is like akola_metrics then we ca go with this statement. 
        Map<String, Wholesaler_Incentive_Base__c> incentiveAllowedMap = Wholesaler_Incentive_Base__c.getAll();
        /*List<Incentive_Rate_by_City__mdt> cityIncenticeMdtList = [SELECT Id, DeveloperName,City__c,End_Date__c,Incentive_Percentage__c,Start_Date__c FROM Incentive_Rate_by_City__mdt WHERE Start_Date__c <= LAST_MONTH AND End_Date__c >= THIS_MONTH];
        for(Incentive_Rate_by_City__mdt mdtObj: cityIncenticeMdtList) {
            cityIncentiveMdtMap.put(mdtObj.DeveloperName, mdtObj);  // {'Akola_Metrics': AkolaMdtRecotrd, 'Austin_Metrics':AustineMdtRecotrd,.....}
        }*/

        for(Id wholesalerId:  wholesalerpolicyMap.keySet()) {//{'AnkitWholesalerId','ZaidWholesalerId'}
            for( String city: wholesalerpolicyMap.get(wholesalerId).keySet()) {//{'Mumbai','Pune','Sangli','Akola'}
                //String customKey = city + '_Metrics';//Akola_Metrics
                if(incentiveAllowedMap.containsKey(city) && incentiveAllowedMap.get(city).Incentive_Calculation_Allowed__c && cityIncentiveMdtMap.containsKey(city)) {
                    Decimal totalPremiumSold = 0;
                    for( Insurance_Policy__c policies: wholesalerpolicyMap.get(wholesalerId).get(city)) {//[1,3]
                        totalPremiumSold += policies.Premium__c;
                    }

                    Production_Incentive_Calculation__c objPic = new Production_Incentive_Calculation__c();
                    objPic.City__c = city;
                    objPic.Incentive_Percentage__c = cityIncentiveMdtMap.get(city).Incentive_Percentage__c;
                    objPic.Internal_Wholesaler__c = wholesalerId;
                    objPic.Month__c = Datetime.now().addMonths(-1).format('MMMM');
                    objPic.Total_Sales__c = totalPremiumSold;
                    objPic.Year__c = Date.today().addMonths(-1).year();
                    insertPICList.add(objPic);
                }
            }
        }

        if (insertPICList.size() > 0) {
            insert insertPICList;
            incentiveRecordCreatedCount += insertPICList.size();
        }
    }

    public void finish(Database.BatchableContext btContext) {
         AsyncApexJob aSyncJob = [Select TotalJobItems, Status, NumberOfErrors From AsyncApexJob WHERE id = :btContext.getJobId()];
        system.debug('async'+aSyncJob);
        Messaging.SingleEmailMessage sendEmailObj = new Messaging.SingleEmailMessage();
        List<String> toAddresses = new List<String>();
        toAddresses.add('umeshrathodbe@gmail.com');
        sendEmailObj.setToAddresses(toAddresses);
        sendEmailObj.subject = 'Compensation Calculation Completed for Last Month';
        sendEmailObj.htmlbody = '<body><p>Hi All,</p>';
        sendEmailObj.htmlbody += '<p style="color:green;">The batch calculation for Incentive Compensation is completed just now.<br/><br/> Please go ahead and start disbursing the Incentives</p>';
        sendEmailObj.htmlbody += '<p><b>Total Incentives Calculated:'+incentiveRecordCreatedCount+' </b></p>';
        sendEmailObj.htmlbody += '</body>';
        List<Messaging.SingleEmailMessage> sendEmailList = new List<Messaging.SingleEmailMessage>();
        sendEmailList.add(sendEmailObj);

        Messaging.sendEmail(sendEmailList);
    }
}