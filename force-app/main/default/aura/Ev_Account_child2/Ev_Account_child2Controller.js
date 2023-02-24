({
	invoke : function(component, event, helper) {
        var name=event.getParams("accName");
        var name1=JSON.stringify(name);
        console.log('name1'+name1);
        
        console.log('nameget'+name1);
        var action=component.get("c.fetch");
        console.log('action1'+action);
        action.setParams({"accName":name});
         console.log('action'+action);
        action.setCallback(this,function(response){
            var state=response.getState();
            var result=response.getReturnValue();
            console.log('result'+result);
            component.set("v.myList", result);
            
                                        });
        $A.enqueueAction(action);
		
	}
})