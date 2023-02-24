({
	loadaccount : function(component, event, helper) {
        
       var acc=component.get("c.getAccount");
        acc.setCallback(this,function(response){
            
            var state = response.getState();
            if(state=='SUCCESS'){
                
                var Result=response.getReturnValue();
                
                var clientsoption = [];
                for (var i = 0; i < Result.length; i++) {
            var client = {
                "label": Result[i].Name,
                "value": Result[i].Id
            };
            clientsoption.push(client);
        }
         component.set("v.AccountList",clientsoption);
               
                
            }  
          });
        $A.enqueueAction(acc);
		
	},
    
    showPolicy : function(component, event, helper) {
       component.set("v.showdata",true);
    },

    refresh : function(component, event, helper) {
        component.set("v.AccountList",null);
        component.set("v.Fromdate",null);
        component.set("v.Todate",null);
        
        
    },
    onChange : function(component, event, helper) {
        var selectClient=event.getParams("value");
        alert("Option selected with value: '" + JSON.stringify(selectClient) + "'");
        
       
        
        
    }        
})