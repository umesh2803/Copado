public class process_demo {
    @invocablemethod
    public static void createaccount(list<id> ids){
        
        list<contact> con=[select id,lastname,accountID from contact where AccountID IN : ids];
        
        for(contact con1:con){
            account acc=new account();
            acc.Id=con1.AccountId;
            acc.Name=con1.lastname;
            
            update acc;
            
        }
    }
    

}