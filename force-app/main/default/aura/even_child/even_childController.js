({
	show : function(component, event, helper) {
        var evt=component.getEvent("firstcall");
        evt.setParams({"Empname":"umesh rathod"});
        evt.fire();
		
	}
})