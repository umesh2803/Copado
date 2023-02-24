public class soqlinsert {
    
    public void main()
    {
        list<account> acc=new list<account>();
        list<contact> con=new list<contact>();
        
        account a1=new account();
        a1.Name='samrat3';
        a1.AccountNumber='3385128203';
        a1.Industry='banking';
       
        acc.add(a1);
        insert acc;
        system.debug(acc);
       
        ID i=a1.Id;
        
            
        contact c1=new contact();
        c1.FirstName='sammy3';
        c1.LastName='samosa';
        c1.AccountId=i;
        
        con.add(c1);
        insert con;
        system.debug(con);
        
        
        
        
    }
}