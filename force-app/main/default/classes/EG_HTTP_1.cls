public class EG_HTTP_1 {

  public void getAndParse() {

    // Get the XML document from the external server
    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://docsample.herokuapp.com/xmlSample');
    req.setMethod('GET');
    HttpResponse res = http.send(req);

    // Log the XML content
    System.debug(res.getBody());

   

 
  }
}