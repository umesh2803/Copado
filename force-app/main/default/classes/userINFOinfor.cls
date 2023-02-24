public class userINFOinfor implements schedulable {
    public void execute(schedulablecontext sc)
    {
		list<account> acc=[select id,name from account];
       
        for(account a:acc)
        {
            
            a.name='MR'+a.name;
            
        }update acc;
    }
}