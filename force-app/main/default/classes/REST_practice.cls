@RestResource(urlmapping='/YRDProspectsdetail/*')
global class REST_practice {
    @HttpPut
    global static REST_wrapper updateclientdetail(string phone){
        REST_wrapper objrs=new REST_wrapper();
        
            map<string,string> params=RestContext.request.params;
        if(params.containsKey('ID')){
            list<account> clientlist=[SELECT id,name ,billingcity,phone FROM account WHERE id=:params.get('ID')];
            if(clientlist.size()>0){
            clientlist[0].phone=phone;
            update clientlist[0];
            objrs.IsSuccess=true;
            objrs.AccountID=clientlist[0].id;
            }
           
           }return objrs; 
        
    }

}

/* account clientaccount=new account();
    public REST_practice(){
        list<account> clientlist=[SELECT id,active__c,phone,type,billingcity FROM account WHERE id='0015g00000YuQNBAA3'];
    	clientaccount=clientlist[0];
        system.debug('list'+clientaccount);//If line no 6 is not assign then it will give null value;
        system.debug('list'+clientlist);
    } */