@RestResource(urlMapping='/myservice/*')
Global class Rest_integration{
    @HttpGet
    Global static account get(){
        RestRequest request=Restcontext.request;
        RestResponse Response=Restcontext.Response;
        ID ID=Request.params.get('ID');
        
        account acc=[SELECT ID,name,phone FROM account WHERE id=:ID];
        
        return acc;
} 
    @Httppost
    
    Global static Rest_integration_wrapper createAccount(string Name,string phone)
    {
      Rest_integration_wrapper rpobj=new Rest_integration_wrapper();
          try{ 
               account acc=new account();
               acc.Name=Name;
               acc.Phone=phone;
               insert acc;
              rpobj.IsSuccess=true;
              rpobj.accountID=acc.Id;
           }catch(Exception e){
             	rpobj.IsSuccess=false;
               rpobj.IsError='Error:'+e.getLineNumber()+''+e.getMessage();
           }
       
        return rpobj;
    }
  /*   @Httppost
    
    Global static string createAccount(string Name,string phone)
    {
       system.JSONGenerator jp=JSON.createGenerator(true);
        jp.writeStartObject();
        jp.writeFieldName('status');
        
        try{ 
               account acc=new account();
               acc.Name=Name;
               acc.Phone=phone;
               insert acc;
        jp.writeString('is success');
        jp.writeIdField('Id', acc.Id);
           }catch(Exception e){
        jp.writeString('Error');
        jp.writeStringField('Error msg', e.getMessage());   
           }
        jp.writeEndObject();
        string result=jp.getAsString();
        return result;
    }*/
    @Httpput
    
    global static string updateno(string phone){
        
        Restrequest request=Restcontext.request;
        RestResponse Response=Restcontext.response;
        string ID=request.params.get('ID');
            system.JSONGenerator jp=JSON.createGenerator(true);
            jp.writeStartObject();
            jp.writeFieldName('status');
        try{
            list<account> acc=[select id,name,phone from account where id=:ID];
            acc[0].Phone=phone;
            update acc;
            
            jp.writeString('success');
            jp.writeIdField('ID', acc[0].Id);
                
        
        }catch(Exception e){
            jp.writeString('Erroe');
            jp.writestringfield('ERROr',''+e.getMEssage());
        }
        jp.writeEndObject();
        string result=jp.getAsString();
        return result;
        
        
        
        
        
        
    }
}