public class HTTP_scan_1 {
    public string endpoint {set;get;}
    public string body	   {set;get;}
    list<map<string,string>> bookmap {set;get;}
    map<string,string> mymap {set;get;}
    
    public void call(){
        bookmap=new list<map<string,string>>(); 
        Http p=new Http();
        Httprequest Request=new Httprequest();
        Request.setEndpoint(endpoint);
        Request.setMethod('GET');
        HttpResponse Response=p.send(request);
        body=response.getbody();
        system.debug('status'+response.getStatus());
        dom.Document doc=new dom.Document();
        doc.load(body);
        dom.XmlNode root=doc.getrootelement();
      
        list<dom.XmlNode> firstchild=root.getchildelements(); 
        system.debug('firstchild'+firstchild);
        for(dom.XmlNode F1:firstchild){         
            
            mymap=new map<string,string>();
            
            list<dom.XmlNode> firsttofirstchild=F1.getchildelements();  
            for(dom.XmlNode F2:firsttofirstchild){
                
                mymap.put(F2.getName(),F2.getText());
            }
            bookmap.add(mymap);
        
        }

    }
}