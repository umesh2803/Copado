({
	clienton : function(component, event, helper) {
        var action=component.get("c.getClient");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS'){
                var Result=response.getReturnValue();
                component.set("v.Account",Result.Acclist);
                component.set("v.Policy",Result.polylist);
                
            }
            
        });
        $A.enqueueAction(action);
		
	},
    
    Clientchange : function(component, event, helper){
        
        var selectClient=event.getSource().get("v.value");
       
        component.set("v.SelectedAccount",selectClient);
        
          var policy=$A.get("e.c:EVENT_YRD_AP");
          policy.setParams({
            
            Accountid : selectClient
            
        });
        policy.fire();
    },
     
    policychange : function(component, event, helper){
        var selectPolicy=event.getSource().get("v.value");
        component.set("v.Selectedpolicy",selectPolicy);
    },
    RefreshAll : function(component, event, helper){
        component.set("v.SelectedAccount",null);
        component.set("v.Selectedpolicy",null);
        component.find("Account").set("v.value",null);
        component.find("Policy").set("v.value",null);
         var selectClient=event.getSource().get("v.value");
       
        component.set("v.SelectedAccount",null);
        
          var policy=$A.get("e.c:EVENT_YRD_AP");
          policy.setParams({
            
            Accountid : null
            
        });
        policy.fire();
        
        
        
    }
})