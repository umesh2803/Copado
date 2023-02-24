({
	handleload : function(component, event, helper) {
		component.find("premium").set("v.value",0);
	},
    
    handlesucces : function(component, event, helper) {
        var policyPurchased=event.getParam("response");
        var navigate = $A.get("e.force:navigateToSObject");
              navigate.setParams({
                  "recordId" : policyPurchased.id
              });
              navigate.fire();
    }
})