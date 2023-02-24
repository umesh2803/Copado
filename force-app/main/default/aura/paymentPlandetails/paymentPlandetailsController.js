({
	getmile : function(component, event, helper) {
        var policyid=event.getParam("policyID");
        var premium=event.getParam("premium");
        var renewal=event.getParam("renewal");
        var milestone=component.get("c.getmilestone");

       milestone.setParams({
        policyid : policyid,
        premium : premium,
        renewal : renewal
       });

       milestone.setCallback(this,function(response){
               var state=response.getState();
               if(state=='SUCCESS'){
                       var mileresult=response.getReturnValue();
                       component.set("v.milelist",mileresult);
               }
       });
       $A.enqueueAction(milestone); 
       component.set("v.showmile",true);
		
	}
})