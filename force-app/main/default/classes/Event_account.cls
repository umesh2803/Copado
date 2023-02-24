public class Event_account {
    @AuraEnabled
    public static list<contact> fetch(string accName)
    {
        account acc=[select id,name from account where name=:accName];
        list<contact> con=[select id,Lastname,Firstname from contact where accountId=:acc.Id];
        return con;
    }

}