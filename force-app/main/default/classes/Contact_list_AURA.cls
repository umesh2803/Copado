public class Contact_list_AURA {
    @AuraEnabled
    public static list<contact> getcall(string accName){
        Account acc=[select id From Account where name=:accName];
        list<contact> contacts=[select id,LastName,FirstName,Phone from contact where AccountId=:acc.id];
        return contacts;
        
        
    } 

}