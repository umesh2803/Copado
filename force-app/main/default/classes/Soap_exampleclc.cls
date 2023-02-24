public class Soap_exampleclc {
    public string username 			{set;get;}
    public string password 			{set;get;}
    public string result   			{set;get;}
    public string conlastname   	{set;get;}
    public string confirstname  	{set;get;}
    public string conphone   		{set;get;}
    public string status   			{set;get;}
    
    public void login(){
        partener_example.Soap sp=new partener_example.Soap();
        partener_example.LoginResult logindetails=sp.login(username, password);
       
        result='sessionId:'+logindetails.sessionId;
        
        service_example.Soap_demo service=new service_example.Soap_demo();
        service_example.SessionHeader_element ss=new service_example.SessionHeader_element();
        ss.sessionId=logindetails.sessionId;
        service.SessionHeader=ss;
       
        status=service.create(conLastname, confirstname, conphone);
        
        
    }

}