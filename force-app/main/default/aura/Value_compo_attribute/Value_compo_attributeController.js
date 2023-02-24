({
	addme : function(component, event, helper) {
        var aval=component.get("v.aval");
        var bval=component.get("v.bval");
        result=parseInt(aval)+parseInt(bval);
        component.set("v.Result",result);
        var result=component.get("v.Result");
		
	}
})