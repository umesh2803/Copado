public class XML_DESERLIZE_1 {
    public string xmlstring {set;get;}
    public string result {set;get;}
    public string result1 {set;get;}
    
    public void convert()
    {
        dom.Document doc=new dom.Document();
        doc.load(xmlstring);
        dom.XmlNode root=doc.getRootelement();
        
        list<dom.XmlNode> child=root.getchildelements();
        for(dom.XmlNode c:child){
           result=result+ '\n'+c.getName();
          list<dom.XmlNode> child1=c.getchildelements();
            for(dom.XmlNode c1:child1){
                result=result+ '\n'+c1.getName()+':'+c1.getText();
                /*1-account then /n will execute
                 * id-15323155
                 * step1-result=account:
                 *              id:2154551
                 * step2:result=account:
                 *              id:2154551
                 *              name:umesh
                 * step:result=account:
                 *             id:2154551
                 *             name=umesh
                 *             city=pune*/              
                
            }
        
        
        
        }
        
        
    }

}