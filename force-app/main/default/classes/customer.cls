public class customer {
    
   list<customer__c> cust=new list<customer__c>();
    
    public void main()
    {
        customer__c c1=new customer__c();
        c1.Name='umesh';
        c1.balance__c=200000;
        c1.joining_date__c=date.newInstance(2021, 08, 28);
        customer__c c2=new customer__c(Name='rohit',balance__c=500000,joining_date__c=system.today());
        
        cust.add(c1);
        cust.add(c2);
        system.debug('new record'+cust);
        insert cust;
        
        
        
        
        
    }

}