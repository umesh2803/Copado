public class bankdetail {
    
    public Bank__c a{set;get;}
   
    
    
    public bankdetail()
    {
        a=new bank__c();
               
    }
    public bank__c main()
    {
        insert a;
        return null;
        
    }

}