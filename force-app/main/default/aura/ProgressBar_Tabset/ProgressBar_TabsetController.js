({
	show : function(component, event, helper) {
		var step=component.get("v.step");
        var count=parseInt(step);
        count=count+1;
        component.set("v.step",''+count);
       
        
        
	},
    call : function(component, event, helper) {
        var step=component.get("v.step");
        var count=parseInt(step);
        count=count-1;
        component.set("v.step",''+count);
    },
    invoke : function(component, event, helper) {
        confirm(success);
    }
})