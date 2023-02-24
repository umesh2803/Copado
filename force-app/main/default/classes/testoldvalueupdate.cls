@isTest
public class testoldvalueupdate {
    @isTest
    static void main()
    {
        customer__c c=new customer__c();
        c.Name='test';
        c.balance__c=120;
        c.joining_date__c=system.today();
        insert c;
       
        test__c t=new test__c();
        t.customer__c=c.Id;
        t.Name='test1';
        t.joining_date__c=system.today();
        t.balance__c=130;
        insert t;
        
        customer__c c1=[select id,balance__c from customer__c where name='test'];
       	c1.Name='test123';
        c1.balance__c=140;
        update c1;
        
        test__c t1=[select id,customer__r.name,customer__r.balance__c from test__c where customer__c=:c1.Id];
       	
        t1.Name=c1.Name;
        t1.balance__c=c1.balance__c;
        update t1;
        system.assertEquals(140, t1.balance__c);
        system.assertEquals('test123', t1.Name);
        system.assertEquals(c1.Id, t1.customer__c);
        
      

      
        
         
       } 
        
    }