public class JASON_GENERATOR_1 {
    public string jsonstring {set;get;}
    public map<string,object> resmap {set;get;}
    
    public JASON_GENERATOR_1(){
        
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
            resmap.put(js1.getText(),js1.getCurrentToken());
            system.debug('map :'+resmap);
        }
        
        
        
        
        
        
    }

}