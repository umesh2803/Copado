({
	getpolicyDate : function(component, event, helper) {
             var isFromRecordHome = false;
             var recordynamic;
        if(component.get("v.recordId") != null){
            isFromRecordHome = true;
            recordynamic =component.get("v.recordId");
            console.log('record id:-'+recordynamic);
        }else{
            
           recordynamic=component.get("v.clientId");
        }
        
            var action=component.get("c.getPolicy");
            action.setParams({
            clientId: recordynamic,
                
            Fromdate:component.get("v.Fromdate"),
                
            Todate:component.get("v.Todate"),
                
            FromRecordId:isFromRecordHome
            });
        
            action.setCallback(this,function(res){
            var state=res.getState();
            if(state=='SUCCESS'){
            var result=res.getReturnValue();
            component.set("v.InsureList",result);
                component.set("v.LoadedClients",true);
                
                
               }
            
            
        }); 
        $A.enqueueAction(action);
            		
	}
})