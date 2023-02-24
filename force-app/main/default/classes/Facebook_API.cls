public class Facebook_API {
    public string ClientID			{set;get;}
    public string ClientSecret	    {set;get;}
    public string AccessToken		{set;get;}
    public string Callback			{set;get;}
    public string code			    {set;get;}
    public string urlEncode			{set;get;}
    public string state			    {set;get;}
    
    public Facebook_API(){
        Callback='https%3A%2F%2Fphonepay-dev-ed.my.salesforce.com%2Fapex%2Ffacebook_accesstoken';
    } 
    /*public pageReference requestCode(){
       string url='https://www.facebook.com/v12.0/dialog/oauth?';
       url=url+'Client_id='+ClientID;
       url=url+'&redirect_uri='+callback;
       url=url+'&state='+state;
       pageReference p=new pageReference(url);
       return p;
    }
    public void Readcode(){
        code=Apexpages.currentPage().getparameters().get('code');
        
    }*/
    public void requestToken(){
        string url='https://graph.facebook.com/v12.0/oauth/access_token?';
        url=url+'Client_id=473793004168380';
        url=url+'&redirect_uri=https%3A%2F%2Fphonepay-dev-ed.my.salesforce.com%2Fapex%2Ffacebook_accesstoken';
        url=url+'&client_secret=2e16764ee68f5e1955473879c93662a8';
        url=url+'&code=AQBPMxwFgrKUuK084Aaol323MJiGQ0dekRl1xHuQsykB9llvr0eJ2nIX8t5InG0fEXuBou5m1lGWDiMLqYDv-viFlFsl9T-Q9n5KK-jCJOaJdO79qz2qNHGq2u_Zm5HULT6sKg1s--VlcwkkH8_uPYZHm1xZrA934cHKpZxC7ezJU2EycB3L99ssWbffL4BPHrh143szBhT7GE5izj3wHBR_EMpK7mKtZfvOmPUlrtWUoJgglAtdPfduUGSVbqgxs8GqiZWuiDHvlmLpHzbwmAVP_tK8pC5BsXMSsTBH6Oqc0q9EvNYPXIecEHsk7pnf7SQRBuM_IyWyv5DqWBJfCNt6UuTQ__hS5g6JJG_HGKP9Dw586q-66UVRJKtSPvIMBfY';
        
        Http p=new Http();
        httpRequest Request=new httpRequest();
        Request.setEndpoint(url);
        Request.setMethod('GET');
        httpResponse Response=p.send(Request);
        string body=Response.getBody();
        system.debug('body='+body);
        system.JSONParser js=Json.createParser(body);
        while(js.nextToken()!=null){
            if(js.getText()=='access_token'){
                js.nextToken();
                AccessToken=js.getText();
            }
        }
        
    }
    	
    

}