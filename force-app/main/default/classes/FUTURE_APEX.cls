public class FUTURE_APEX {
    @future
    public static void FUTURE_APEX1(){
         ID userID=userinfo.getUserId();
        list<PermissionSetAssignment> ps=[SELECT  id,PermissionSetId,AssigneeId from PermissionSetAssignment WHERE AssigneeId=:userID AND PermissionSetId='0PS5g000007nr7yGAA'];
        delete ps;
    }

}