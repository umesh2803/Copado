public class urlpage {
    public GATE_Student_Information__c gt{get;set;}
    public string cid{get;set;}
    public string cpassword{get;set;}
    public PageReference pageRef;
    public Apexpages.StandardController controller;
    public urlpage(Apexpages.StandardController controller)
    {
        
        this.controller=controller;
    }
  
    
		public pageReference show()
        {	
              
              GATE_Student_Information__c g=[select id,confirm_password__c from GATE_Student_Information__c where id=:cid];
              
              
               PageReference pageRef = new PageReference('https://phonepay-dev-ed.lightning.force.com/lightning/r/GATE_Student_Information__c/'+cid+'/view');
               pageRef.setredirect(true);
               return pageRef;
              
           
             
             
              
                            
               
    
        }
}