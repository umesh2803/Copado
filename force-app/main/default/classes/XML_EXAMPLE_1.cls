public class XML_EXAMPLE_1 {
    public string result{set;get;}
    public string SearchText {set;get;}
    public void show(){
       account acc =[select id,name,industry,phone,(select id,Lastname,Firstname,phone from contacts) from account where name=:SearchText];
        dom.Document doc=new dom.Document();
        dom.XmlNode root=doc.createrootelement('company',null,null);
        root.setAttribute('name', acc.name);
        root.setAttribute('industry', acc.Industry);
        root.setAttribute('phone', acc.Phone);
        dom.XmlNode childroot=root.addchildelement('Header',null,null);
        childroot.setAttribute('status', 'success');
        childroot.setAttribute('person',''+acc.contacts.size());
       
        
        if(acc.contacts.size()>0)
        {
        for(contact c:acc.contacts){
        dom.XmlNode person=root.addchildelement('person',null,null);
        dom.XmlNode lname=person.addchildelement('Lastname',null,null);
        lname.addTextNode(c.lastname);
        dom.XmlNode fname=person.addchildelement('Firstname',null,null);
        fname.addTextNode(c.FirstName);
        dom.XmlNode phone=person.addchildelement('phone',null,null);
        phone.addTextNode(c.Phone);
        }
        }
         result=doc.toXmlString();    } 

}