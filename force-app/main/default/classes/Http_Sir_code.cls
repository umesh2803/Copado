global class Http_Sir_code {
    public string body   {set;get;}
    public string endpoint {set;get;}
    map<string,object> obj {set;get;} 
    global void create()
    {  
        Http p=new Http();
        HttpRequest request1=new HttpRequest();
        request1.setEndpoint('https://zahidapisite-developer-edition.ap24.force.com/services/apexrest/YRDProspectsHandling?Id=0015g00000Zx4bCAAR');
        request1.setMethod('GET');
   	    HttpResponse response=new HttpResponse();
        response=p.send(request1);
        body=response.getBody();
        system.debug('status'+response.getStatuscode());
        if(response.getStatuscode()==200){
            obj=new map<string,object>();
            obj=(map<string,object>)JSON.deserializeUntyped(response.getBody()); 
            system.debug('KEYSET='+obj.keySet());
            system.debug('Phone='+obj.get('Phone'));
            system.debug('Body='+body);
            system.debug('Body='+obj);
        }
        
    }

}