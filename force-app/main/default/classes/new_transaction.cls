public class new_transaction {
    
    list<Transaction__c> trans=new list<Transaction__c>();
    
    public void main()
    {
      Transaction__c t1=new Transaction__c();
        t1.name='test1';
        t1.More__c='cash';
      
      Transaction__c t2=new Transaction__c();
        t2.name='test2';
        t2.More__c='online';
        Transaction__c t3=new Transaction__c(name='test3',More__c='cash');
        Transaction__c t4=new Transaction__c(name='test4',More__c='online');
        
        trans.add(t1);
        trans.add(t2);
        trans.add(t3);
        trans.add(t4);
        
        system.debug('record--'+trans);
        insert trans;
        
        
        
      
      
    
    
    }

}