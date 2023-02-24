public class AccountTrgiggerHandler {
    public static void afterinertHandler(list<account>newaccounts){
    if(Recursivetrigger.recursivetriggerOP == false){
    list<account> insertchildaccountlist=new list<account>();
    for(account acc:newaccounts)
    { 
      account objchildaccount=new account();
      objchildaccount.Name=acc.name +'-secondary';
      objchildaccount.ParentId=acc.id;
	  insertchildaccountlist.add(objchildaccount);     	
       
    }	Recursivetrigger.recursivetriggerOP =true; /*recursive trigger if we insert Account A it will creat 
                                                    * another clild account again 
                                                    * that child acoount will insert another child account 
                                                    * so this is called recursive trigger.To avoid this use 
													  static class variable in other class.*/
        


		insert insertchildaccountlist;
        
        user currentusers=[select id,name FROM user where id=:userinfo.getUserId()];//global variable userinfo.
        
        currentusers.Last_Created_client_date__c=datetime.now();
        update currentusers;
        
        set<id> userIDset=new set<id>();
        userIDset.add(userinfo.getUserId());
        
        system.enqueueJob(new Userupdatequehandlershow(userIDset));
        
    }
}
}