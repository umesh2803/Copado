@RestResource(urlMapping='/YRDProspectsHandle/*')
global class JASON_GENERATOR_2 {
    
    @HttpPost
   global static string createaccount(string accName,string accPhone,string accCity,string accType,string accActive,string result){
     	system.JSONGenerator js=JSON.createGenerator(true);
        js.writeStartObject();
       try{
        account Newaccount = new account();
        Newaccount.name=accName;
        Newaccount.phone=accPhone;
        Newaccount.billingcity=accCity;
        Newaccount.Type=accType;
        Newaccount.Active__c=accActive;
        insert Newaccount; 
        js.writeStringField('isSuccess','true');
        js.writeIdField('id',Newaccount.Id);
       
        }
       catch(Exception e){
        js.writeStringField('isSuccess','false');
        js.writeStringField('ERROR',e.getMessage());
           
       }
       js.writeEndObject();
       result=js.getAsString();
       return result;
    } 
    @Httpput
    global static string updateClientDetails(string phone,string result){
        
        system.JSONGenerator js=JSON.createGenerator(true);
        js.writeStartObject();
        try{   
        map<string,string> params=Restcontext.request.params;
        if(params.containsKey('ID'))           
        {									   
            list<account> clientlist=[SELECT id,name,active__c,phone,type,billingcity FROM account WHERE id=:params.get('ID')];
            if(clientlist.size()>0){
            clientlist[0].phone=phone;
            update clientlist[0];
            js.writeStringField('isSuccess','true');
            js.writeIdField('id',clientlist[0].Id);
            }else{
                js.writeStringField('ERRORMSG:','plese send valid id');
                js.writeIdField('id',params.get('ID'));
            }
        }
            else{
                  js.writeStringField('ERRORMSG:','plese send  id');     
            }
        }
            catch(Exception e){
                 js.writeStringField('isSuccess','false');
                 js.writeStringField('ErrorMsg', e.getLineNumber()+e.getMessage());
            } js.writeEndObject();
              result = js.getAsString();
              return result; 
         
       
    }
    

}