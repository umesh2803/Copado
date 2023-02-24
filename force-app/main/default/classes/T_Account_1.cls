public class T_Account_1 {
    public string name;
    public string industry;
    public string rating;
    
    public void main()
    {
        Account a1=new Account();
        a1.Name='jumbo2';
        a1.Industry='Banking';
        a1.Rating='Hot';
        insert a1;
        
        Account a2=new Account();
        a2.Name='jumbo3';
        a2.Industry='Banking';
        a2.Rating='Hot';
        insert a2;
        
        
    }

}