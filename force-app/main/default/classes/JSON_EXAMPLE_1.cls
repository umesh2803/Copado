public class JSON_EXAMPLE_1 {
    public string integervalue 							{set;get;}
    public string decimalvalue 							{set;get;}
    public string accountvalue 							{set;get;}
    public string studentvalue 							{set;get;}
    public string integervaluepretty 					{set;get;}
    public string decimalvaluepretty 					{set;get;}
    public string accountvaluepretty 					{set;get;}
    public string studentvaluepretty 				    {set;get;}
    public string studentvaluewithoutsuppressnulls 	    {set;get;}
    public string studentvaluenullwithsuppressnulls 	{set;get;}
    public JSON_EXAMPLE_1(){
        integervalue=json.serialize(10);
        decimalvalue=JSON.serialize(456.12);
        account acc=new account();
        acc.Name='umesh';
        acc.Phone='123456789';
        acc.BillingCity='pune';
        accountvalue=JSON.serialize(acc);
        JASON_STUDENT_WRAPPER js=new JASON_STUDENT_WRAPPER('xyz','123456','yavatmal');
        studentvalue=JSON.serialize(js);
         integervaluepretty=json.serializepretty(10);//--pretty---IT gives good look to display one character space;
         decimalvaluepretty=JSON.serializepretty(456.12);
         accountvaluepretty=JSON.serializepretty(acc);
         studentvaluepretty=JSON.serializepretty(js);
         
        JASON_STUDENT_WRAPPER js1=new JASON_STUDENT_WRAPPER(); 
        js1.name='xyz';
        js1.city='pune';
        studentvaluewithoutsuppressnulls=JSON.serialize(js1);
        studentvaluenullwithsuppressnulls=JSON.serialize(js1,true);
        
    }

    

}