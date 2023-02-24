public class dmlupdate1 {
   
    public void main(){
   
list<list<sobject>> obj=[FIND 'samrat3' in name fields returning account(name,phone),contact(name,phone)];
        
      
       
       /* list<contact> conlist=new list<contact>();
        obj.add(conlist);
        list<account> acclist=new list<account>();
        obj.add(acclist);*/
        list<account> acclist=obj[0];
        list<contact> conlist=obj[1];
        
        system.debug('index'+obj.get(0));
        
        for(account a:acclist)
        {
            a.phone='555559656';
             update a;
            
        }for(contact c:conlist)
        {
            c.phone='6666669667';
            update c;
        }
        
                     
        
        
        
       
        
    
    }
}