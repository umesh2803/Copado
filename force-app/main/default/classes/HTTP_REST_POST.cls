global class HTTP_REST_POST {
    
    public string body     {set;get;}
    public string endpoint {set;get;}
    map<string,object> obj {set;get;} 
    global void create()
    {  
        Http p=new Http();
        HttpRequest request1=new HttpRequest();
        request1.setEndpoint('https://triggeredfellow-developer-edition.ap27.force.com/services/apexrest/letmeintroduce');
        request1.setMethod('POST');
        request1.setHeader('Content-Type', 'application/json');
        request1.setBody('{"accName": "Umesh","accPhone": "0000307788","accType": "Prospect","accCity": "Pune"}');
   	    HttpResponse response=new HttpResponse();
        response=p.send(request1);
        body=response.getBody();
        system.debug('status'+response.getStatuscode());
        if(response.getStatuscode()==200){
            obj=new map<string,object>();
            obj=(map<string,object>)JSON.deserializeUntyped(response.getBody()); //-Deserilizing string to object;
            system.debug('KEYSET='+obj.keySet());
            system.debug('Body='+body);
            system.debug('Body='+obj);
        }
        
    }

}