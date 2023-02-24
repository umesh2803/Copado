public class Http_API_currency {
    public string response ;
    public Http_API_currency(){
        
        string url='http://data.fixer.io/api/latest?access_key=18226ebed8cb9aa7820a389b1e692af2';
        url=url+'&base=GBP';
        url=url+'&symbols=USD,AUD,CAD,PLN,MXN';
       
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse Response=p.send(request);
        string body=Response.getbody();
        string status=Response.getStatus();
        
        system.debug('body'+body);
        system.debug('status'+status);
        
     }

}