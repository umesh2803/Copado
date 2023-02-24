({
	invoke : function(component, event, helper) {
        var name=event.getParam("Empname");
        component.set("v.myname", name);
        
		
	}
})