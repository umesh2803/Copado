public class objectMERGE {
    
    public void main()
    {	list<account> acclist=new list<account>();
        list<account> acclist1=new list<account>();
        account a1=[select name,phone,industry,ownership,email__c from account WHERE name='karate kid'];
        account a2=[select name,phone,industry,ownership,email__c from account WHERE name='test1'];
        account a3=[select name,phone,industry,ownership,email__c from account WHERE name='test2'];
        account a4=[select name,phone,industry,ownership,email__c from account WHERE name='test3'];
     
        acclist.add(a2);
        acclist.add(a3);
       
        
        merge a1 acclist ;
     
        
        
        
        
        
    }

}