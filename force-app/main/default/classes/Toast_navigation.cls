public class Toast_navigation {
    @AuraEnabled
    public static string getCall(string Name,string Phone){
        account acc=new account();
        acc.Name=Name;
        acc.Phone=Phone;
        insert acc;
        
        return acc.id;
    }

}