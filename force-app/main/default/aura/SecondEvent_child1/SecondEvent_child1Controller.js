({
	call : function(component, event, helper) {
        var evt=$A.get("e.c:SecondEvent");
        evt.setParams({"accName":"Umesh Rathod"});
        evt.fire();
	}
})