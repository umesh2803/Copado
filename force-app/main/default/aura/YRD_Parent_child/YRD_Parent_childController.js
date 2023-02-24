({
	invoke : function(component, event, helper) {
        var action=component.get("c.GetList");
        action.setCallback(this,function(Response){
             var state=Response.getState();
             console.log('state'+state);
        if(state=='SUCCESS'){
            var Result=Response.getReturnValue();
            var ClientOptions = [];
        for (var i = 0; i < Result.length; i++) {
            var Client = {
                "label":Result[i].Name,
                "value":Result[i].Id
            };
            ClientOptions.push(Client);
        }
      
            component.set("v.ClientList", ClientOptions);
            helper.helperMethod("proceed","successfully fetch",5000,"success");
                   }
            else{
           helper.helperMethod("error","failed to fetch",5000,"error");
        }
                           
                          });
        $A.enqueueAction(action); 
		
	},
    
    showpolicy : function(component, event, helper){
        var clientId=component.get("v.clientId");
        var fromdate=component.get("v.Fromdate");
        var todate=component.get("v.Todate");
        
        const formatedFormdate=new Date(fromdate);
        const formatedTodate=new Date(todate);
        
     if(formatedFormdate > formatedTodate){
            component.set("v.showdata", false);
            helper.helperMethod("error","form date should not be greater than to date",5000,"error");
            
        }else{
            component.set("v.showdata", true);
            var Clientholder=component.find("InsID");
            Clientholder.Refresh(false);
        }
        
        
        
    },
    
    resetFilters : function(component,event,helper){
        component.set("v.clientId",null);
        component.set("v.Fromdate",null);
        component.set("v.Todate",null);
        var Clientholder=component.find("InsID");
            Clientholder.Refresh(true);
    }
    
    

})