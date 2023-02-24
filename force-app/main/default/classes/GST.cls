public class GST {
    public decimal Amount{set;get;}
    public decimal GST{set;get;}
    public decimal Discount{set;get;}
    public decimal Finalamount{set;get;}
    public decimal quantity{set;get;}
    public decimal price{set;get;}
   
    
    public void cal()
    {
        amount=price*quantity;
        Finalamount=amount+(amount*GST/100)-(amount*Discount/100);
        system.debug(Finalamount);
        
    }
    

}