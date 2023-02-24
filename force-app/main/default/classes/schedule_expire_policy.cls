public class schedule_expire_policy implements schedulable {
    public void execute(SchedulableContext sc){
       User currentUser = [SELECT Id, Last_Created_Client_Date__c FROM User WHERE Id =: UserInfo.getUserId()][0];
       currentUser.Last_Created_Client_Date__c = Datetime.now();
       update currentUser;
     
        database.executeBatch(new Expire_policy(), 1);
        main();
      
        
    }
    @future(callout=true)         
    public static void main(){
        ID userID=userinfo.getUserId();
        list<PermissionSetAssignment> ps=[SELECT  id,PermissionSetId,AssigneeId from PermissionSetAssignment WHERE AssigneeId=:userID AND PermissionSetId='0PS5g000007nr7yGAA'];
        delete ps;
    }
     
}//future word always use on method it will give error if it is used on class.to avoid DML mIX error 
  //we use future in that just take method name and call that in other method of object creation.
  //IN above class we wrote main()method in schedular method to call it.
  //HERE with this we have avoided the error which arises due to mix DML.
  //SETUP OBJECT-PERMISSION SET......---...NON-SETUP OBJECT-USER.