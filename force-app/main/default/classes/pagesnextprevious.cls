public class pagesnextprevious{

    public apexpages.StandardSetController controller{set;get;}
    public list<Opportunity> getopty()
    {
        List<Opportunity> optylst=(list<opportunity>)controller.getrecords();
        return optylst;
    }
    
    public pagesnextprevious()
    {
        List<Opportunity> optylst=[select id,name,stagename,closedate from opportunity];
        controller=new apexpages.StandardSetController(optylst);
        controller.setpagesize(5);
    }
}