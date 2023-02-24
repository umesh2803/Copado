@RestResource(urlMapping='/YRDProspectsHandling/*')
global class REST_YRDINSURANCE {
    @HttpPost
   global static REST_wrapper createaccount(string accName,string accPhone,string accCity,string accType,string accActive){
        REST_wrapper objrs=new REST_wrapper();
       try{
        account Newaccount = new account();
        Newaccount.name=accName;
        Newaccount.phone=accPhone;
        Newaccount.billingcity=accCity;
        Newaccount.Type=accType;
        Newaccount.Active__c=accActive;
        insert Newaccount; 
        objrs.IsSuccess=true;
        objrs.AccountID=Newaccount.id;
        }
       catch(Exception e){
           objrs.IsSuccess=false;
           objrs.ErrorMsg='Error on line:'+e.getLineNumber()+'.Message:'+e.getMessage();
           
       }
        return objrs;
    }
    @HttpGet
    global static Account returnClientDetail(){
        account clientaccount=new account();
        map<string,string> params=Restcontext.request.params;
        if(params.containsKey('ID'))
        {
            list<account> clientlist=[SELECT id,name,active__c,phone,type,billingcity FROM account WHERE id=:params.get('ID')];
            if(clientlist.size()>0){
             clientaccount=clientlist[0];//here we are assigning list zero index  value to clientaccount so that it will return account information;
            }
        }return clientaccount;
    }
    @Httpput
    global static REST_wrapper updateClientDetails(string phone){
         REST_wrapper objrs=new REST_wrapper();
        try{   
        map<string,string> params=Restcontext.request.params;
        if(params.containsKey('ID'))           
        {									   
            list<account> clientlist=[SELECT id,name,active__c,phone,type,billingcity FROM account WHERE id=:params.get('ID')];
            if(clientlist.size()>0){
            clientlist[0].phone=phone;
            update clientlist[0];
            objrs.IsSuccess=true;
            objrs.AccountID=clientlist[0].id;}
            else{
                objrs.AccountID=params.get('ID');
                objrs.ErrorMsg='Please send valid id in Request Parameter';
            }
        }
            else{
                  objrs.ErrorMsg='please send Id in request parameter';     
            }
        }
            catch(Exception e){
                 objrs.IsSuccess=false;
                 objrs.ErrorMsg='Error on line:'+e.getLineNumber()+'.Message:'+e.getMessage();
            }  return objrs; 
       
    }
   }