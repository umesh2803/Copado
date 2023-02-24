public class JSON_parser_1 {
     public string jsonstring {set;get;}
    public map<string,object> resmap {set;get;}
    
    public JSON_parser_1(){
        
        system.JSONGenerator js=json.createGenerator(true);
        js.writeStartObject();
        js.writeFieldName('Name');
        js.writeString('umesh');
        js.writeStringField('Last Name', 'Rathod');
        js.writeEndObject();
        
        jsonstring=js.getAsString();
        system.debug('value'+jsonstring);
        
        
    }
    public void parser(){
        resmap=new map<string,object>();
        system.JSONParser js1=json.createParser(jsonString);
        while(js1.nextToken()!=null){
            if(js1.getText()=='Name'){
                js1.nextToken();
          string result=js1.getText();
                system.debug('Result : '+result);
  }
        }
             
    }

}