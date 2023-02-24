({
	showpolicy : function(component, event, helper) {
        var accID=event.getParam("Accountid");
        if(accID != null){
        var gettotal=component.get("c.gettotalpolicy");
        gettotal.setParams({
            Accountid : accID
            
        });
        gettotal.setCallback(this,function(res){
		
            var state=res.getState();
            if(state=='SUCCESS'){
                component.set("v.total",res.getReturnValue());
            }
             
      });
        }else{
            component.set("v.total",0);
        }
        $A.enqueueAction(gettotal);
       
    }
})