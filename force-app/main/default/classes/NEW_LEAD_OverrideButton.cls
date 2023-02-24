public class NEW_LEAD_OverrideButton {
    public lead NewLead {set;get;}
    public NEW_LEAD_OverrideButton(Apexpages.StandardController controller)
    {  NewLead=(lead)controller.getRecord();
    }
    public pageReference create(){
        pageReference p;
        integer count=[select count() from Lead where Lastname=:newlead.LastName];
        if(count>0){
            apexpages.message msg=new apexpages.message(apexpages.severity.WARNING,'duplicate Lead');
            apexpages.addMessage(msg);
            
        }else{
            list<account> acc=[select id from account where name=:newlead.Company];
            if(acc.size()>0){
                contact con=new contact();
                con.lastname=newlead.LastName;
                con.FirstName=newlead.FirstName;
                con.AccountId=acc[0].id;
                con.Phone=newlead.Phone;
                con.Email=newlead.Email;
                insert con;
                p=new pageReference('/'+acc[0].id);
           /* apexpages.message msg=new apexpages.message(apexpages.severity.warning,'duplicate company');
            apexpages.addMessage(msg);*/
			
            }else{
                list<contact> con =[select id from contact where lastname=:newlead.LastName AND email=:newlead.Email];
                if(con.size()>0){
                    account acc1=new account();
                    acc1.name=newlead.Company;
                    acc1.Industry=newlead.Industry;
                    insert acc1;
                    con[0].AccountId=acc1.Id;
                    update con[0];
                    p=new pageReference('/'+acc1.Id);
            /*apexpages.message msg=new apexpages.message(apexpages.severity.warning,'duplicate contact');
            apexpages.addMessage(msg);*/
                }else{
                    insert newlead;
                    p=new pageReference('/'+newlead.id);
                }
            }
        } return p;
   }

}