({
	showpolicy : function(component, event, helper) {
        var clientid=component.get("v.accountID");
        alert(clientid);
        
        var show=component.get("c.getpolicy");
        show.setParams({
            
            AccountID : clientid 
        });
        show.setCallback(this,function(res){
            var state=res.getState();
            if(state=="SUCCESS"){
                console.log(state);
           
             var result=res.getReturnValue();
                console.log(result);
             
            component.set("v.policyList",result);
                
            }
        });
        $A.enqueueAction(show);
		
	}
})