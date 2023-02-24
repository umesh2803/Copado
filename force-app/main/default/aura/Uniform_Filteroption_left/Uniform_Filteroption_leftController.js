({
	getfilterdata : function(component, event, helper) {
        
        var filters = component.get("c.getfilter");
        filters.setCallback(this,function(response){
           var state= response.getState();
         if(state=='SUCCESS'){
            var result=response.getReturnValue();
            component.set("v.accountlist",result.acclist);
            component.set("v.policyList",result.policylist);
             }               
          });
    $A.enqueueAction(filters);
		
	},
    
    onclientselection : function(component, event, helper) {
        var selectclient=event.getSource().get("v.value");
        component.set("v.selectedClient",selectclient);
        
        
        
    },
    onpolicyselection : function(component, event, helper) {
       var selectpolicy=event.getSource().get("v.value");
        component.set("v.selectedpolicy",selectpolicy);
        
    },
    
    refreshpolicy : function(component, event, helper) {
         component.set("v.selectedClient",null);
         component.set("v.selectedpolicy",null);
        component.find("account").set("v.value",null);
        component.find("policy").set("v.value",null);
        
    }
})