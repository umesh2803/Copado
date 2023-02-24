({
	Createhandler : function(component, event, helper) {
        component.find("createRecord").getNewRecord(
            "Contact",   //Sobjectname or ObjectApiname
            null,		//Record ID
            false,      //skip cache?
            $A.getCallback(function(){
                var targetRecord=component.get("v.ConObj");
                var targetError=component.get("v.ObjError");
                if(targetError || (targetRecord===null)) {
                   console.log('Error initilizing record template'+targetError);
                     return;
                    
                   }
                 console.log('Record template initialized:'+targetRecord.apiName);
                  
                 })
            
        );
		
	},
    
    invoke : function(component, event, helper){
        component.set("v.simpleConObj.AccountId",component.get("recordId"));
        component.find("createRecord").saveRecord(function(saveResult){
            if(saveResult.state=='SUCCESS' || saveResult.state=='DRAFT'){
                var toastmsg=$A.get("e.force:ShowToast");
                toastmsg.setParams({
                    "Title":"Saved",
                  "message":"Record succesfully saved"    
                });
                toastmsg.fire();
            }
        });
        
        
        
    }
})