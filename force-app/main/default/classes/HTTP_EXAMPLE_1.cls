public class HTTP_EXAMPLE_1 {
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
        dom.Document doc=new dom.Document();    //deserilizing the XML to object.
        doc.load(body);
        dom.XmlNode root=doc.getrootelement();
       // system.debug('root'+root);				//it will show library,book,author,title,isbn means it will show every element
        
        list<dom.XmlNode> firstchild=root.getchildelements();  //it will show book,author,title,isbn excluding library.
        system.debug('firstchild'+firstchild);
        for(dom.XmlNode F1:firstchild){         // this will loop take all value with book,author.isbn....
             //system.debug('F1'+F1);
            mymap=new map<string,string>();
            
            list<dom.XmlNode> firsttofirstchild=F1.getchildelements();  //here book will get excluded and author ,isbn ,title will be shown.
            for(dom.XmlNode F2:firsttofirstchild){
                // system.debug('F2'+F2);
                mymap.put(F2.getName(),F2.getText());
            }
            bookmap.add(mymap);
        
        }
       // system.debug('body'+body);
       // system.debug('body'+mymap);
       // system.debug('body'+bookmap);
        /*list<account> acc=new list<account>();
        for(map<string,string> m:bookmap){
            account acc1=new account();
            acc1.name=m.get('title');
            acc1.billingcity=m.get('author');
            acc1.Phone=m.get('isbn');
            acc.add(acc1);}
            insert acc;*/
        
        
    }

}
/*<library>
	<book>
		<author>Joe Smith</author>
		<title>Chatty</title>
		<isbn>1234567890</isbn>
	</book>
	<book>
		<author>Carol Yang</author>
		<title>Animal Shelter Volunteering</title>
		<isbn>1111122222</isbn>
	</book>
</library>*/