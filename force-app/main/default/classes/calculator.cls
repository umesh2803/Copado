public class calculator {
    public integer num1{set;get;}
    public integer num2{set;get;}    
    public integer result{set;get;}
    
    public void add()
    {
        result=num1+num2;
        system.debug(result);
    }
   
    public void sub()
    {
        result=num1-num2;
        system.debug(result);
    }
    public void multi()
    {
        result=num1*num2;
        system.debug(result);
    }
    public void div()
    {
        result=num1/num2;
        system.debug(result);
    }

}