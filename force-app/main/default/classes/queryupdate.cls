public class queryupdate {
   
    public void main(){
   
        list<contact> con=[select id,name,email,account.Email__c,account.name from contact where name like 'sammy%'];
        
		for(contact c:con)
        {
          c.Email=c.account.email__c;
              
        } update con;
          
     
    
    }
}














  /*integer i=1;
        for(contact c:con)
        {   c.firstname='sammy'+i;
			c.email='sammy'+i+'@gmail.com';
            i++;
           
        } update con;*/