public class bank {
     public bank__c a { get; set; }
     public bank()
     {
       a=new bank__c();
         
     }
    
     public PageReference save()
      {
      insert a;
        return null;
    }

}