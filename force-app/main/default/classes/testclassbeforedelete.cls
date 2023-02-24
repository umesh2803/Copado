@isTest
public class testclassbeforedelete {
    @isTest
    static void main()
    {
        customer__c c=new customer__c();
        c.name='test';
        c.joining_date__c=system.today();
        insert c;
        test__c t1=new test__c();
        t1.name='testchild';
        t1.customer__c=c.id;
        insert t1;
      
        test__c t=[select id from test__c where customer__c=:c.id];
        delete t;
        customer__c c1=[select id from customer__c];
        delete c1;
        integer count=[select count()from customer__c];
        system.assertEquals(0, count);
        
       
        
        
        
        
    }

}