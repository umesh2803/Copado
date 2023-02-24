public class vfbonus {
    public string city{set;get;}
    public integer experience{set;get;}
    public integer salary{set;get;}
    public integer bonus{set;get;}
    
    public void main()
    {   
        if(city=='hyd'&&experience>3)
        {
            salary = 50000;
            bonus = 5000;
        }else if(city=='pune'&&experience>5) 
        {
            
            salary = 1000000;
            bonus = 20000;
        } 
        
        else{
            
            salary = 30000;
            bonus = 3000;
        }
        
        
        
    }

}