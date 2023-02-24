Global class SOap_practice_1 {
	webservice string name;
    webservice string phone;
    
    webservice static string createaccount(string name,string phone){
        system.JSONGenerator jp=json.createGenerator(true);
        jp.writeStartObject();
        jp.writeFieldName('status');
        
        try{ 
        account acc=new account();
        acc.Name=name;
        acc.Phone=phone;
        insert acc;
        jp.writeString('sucess');
        jp.writeIdField('ID',acc.Id);
        
        }catch(Exception e){
            jp.writeString('Error');
            jp.writeStringField('Error', ''+e.getMessage());
        }
        jp.writeendobject();
        string result=jp.getAsString();
        return result;
    }
    
}