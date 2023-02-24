({
	actionW : function(component, event, helper) {
       helper.getpolicyDate(component, event, helper);
        
		
	},
    RefreshClient :function(component, event, helper){
        var params=event.getParam('arguments');
        if(params){
            var isreset=params.reset;
            if(isreset==true){
                component.set("v.InsureList",null);

                helper.getpolicyDate(component, event, helper);
            }
        }
        
        
        
        
    }
})