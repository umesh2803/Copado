@isTest
public class testforextradml {
    @isTest
    static void call()
    {
        dmlupdateextra dm=new dmlupdateextra();
        dm.main();
         
        list<contact> con=[select id,name,phone from contact];
        for(contact c:con)
        {
            c.phone='1230456';
        }
        update con;
        
        
    }

}