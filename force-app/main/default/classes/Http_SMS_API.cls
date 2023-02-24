public class Http_SMS_API {
     public string response ;
    public Http_SMS_API(){
        
         string url='https://api.textlocal.in/send/';
         string body='sender = TXTLCL&';
         body=body+'message=TestSMS&';
         body=body+'apiKey=NTEzNDU4NzA1MDMxNTQ0OTMyNzc3Njc5MzAzNTMyNDI&';
         body=body+'username=umeshrathodbe@gmail.com&';
         body=body+'password=Umesh123&';
         body=body+'hash=0e42b2bdb50e7cfc507dd35783b29b625fe3b0ab974ae5abca366952f152851d&';
         body=body+'numbers=8329548844';
         
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        request.setBody(body);
        HttpResponse Response=p.send(request);
        string body1=Response.getbody();
        string status=Response.getStatus();
        
        system.debug('body'+body1);
        system.debug('status'+status);
        
     }


}