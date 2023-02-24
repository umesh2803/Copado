public class queueable_expire_policy implements queueable {
    public void execute(queueablecontext contextQT){
        ID userID=userinfo.getUserId();
        list<PermissionSetAssignment> ps=[SELECT  id,PermissionSetId,AssigneeId from PermissionSetAssignment WHERE AssigneeId=:userID AND PermissionSetId='0PS5g000007nr7yGAA'];
        delete ps;
    }
}
/*string cronEXP='0 40 21 * * ?';
system.schedule('myjob1', cronEXP, new schedule_expire_policy());*/