({
	invoke : function(component, event, helper) {
        var Name=component.get("v.Name");
        var Phone=component.get("v.Phone");
       console.log('name='+Name);
        console.log('Phone='+Phone);
        
        
        var action=component.get("c.getCall");
        action.setParams({
            "Name" :Name,
            "Phone" :Phone,
            
        });
        
        action.setCallback(this,function(response){
            var state=response.getState();
            console.log('state'+state);
            if(state=='SUCCESS'){
                var result=response.getReturnValue();
                console.log('recordId:-'+result);
                component.set("v.recordId",result);
               
            }
        });
		$A.enqueueAction(action);
        
        
        
	},
   
   createRecord : function (component, event, helper) {
    var navEvt = $A.get("e.force:showToast");
    navEvt.setParams({
      "title": "error",
        "message":"something went wrong"
      
    });
    navEvt.fire();
}
                
})