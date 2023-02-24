public class controllerregi {
    public string cname{set;get;}
    public string cemail{set;get;}
    
    
     
    public PageReference  controllerregi()
   {    
        bank__c b=new bank__c();
        b.Name=cname;
        b.Email__c=cemail;
        
      
       
     
    list<bank__c> bn=[select id,email__c from bank__c where name=:cname];   
     if(bn.size()>0)
     {   ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.ERROR,'duplicate name found');
            ApexPages.addMessage(msg);
            return null;  
    }
       else
    {
      
        insert b;
        PageReference p=new PageReference('/' +b.Id);
        return p;
        
           
    }
      
   }  
   
       
    }