public class ACCOUNT_trigger_handler {
    
    public static void ACCOUNT_trigger_handlermethod(list<account> ACClist)
    {	
     
     if(RECURSIVE_trigger_account.recursive_AC==false) { 
     list<account> insertedaccount = new list<account>();
     for(account acc:ACClist){
            account accchild=new account();
            accchild.Name=acc.Name+''+'secondary';
         	accchild.ParentId=acc.Id;
            insertedaccount.add(accchild);
        }
     RECURSIVE_trigger_account.recursive_AC=true;
     insert insertedaccount;
     
     }   
    }

}