public class Userupdatequehandlershow implements queueable {
    public set<id> userIDset;//here when controller is called from accounttriggeroperationhandler it will execute this method.
    
    public Userupdatequehandlershow(set<id> users){
           userIDset=users;
    }public void execute(queueablecontext qc){
      list<permissionset> permissiontouser=[select id,name from permissionset where name='Permission_set_account'];
        if(permissiontouser.size()>0){
        list<permissionSetAssignment> pslist=new list<permissionSetAssignment>();
        for(permissionset perassign:permissiontouser)
        {
            permissionsetassignment ps=new permissionsetassignment();
            ps.permissionsetid=permissiontouser[0].id;
            ps.AssigneeId=userinfo.getuserID();
            pslist.add(ps);
            
    }insert pslist;
       
            } 
    }

}