public class dmlupdate {
   
    public void main()
    {
        
        
        list<contact> con=[select id,name,phone from contact];
        for(contact c:con)
        {
            c.phone='12300000';
            update c;
        }
        update con;
   } 
   
    
    

    
    
    
    

}