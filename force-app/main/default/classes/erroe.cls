public class erroe {
    public Database.QueryLocator start(database.BatchableContext btContext)
    {
        string query ='SELECT id,Premium__c,Internal_Wholesaler__c,Account__r.billingcity from Insurance_Policy__c';
            query += 'WHERE Purchase_Date__c = LAST_MONTH AND Premium__c >0';
            return Database.getQueryLocator(query);
    }

}