({
	invoke : function(component, event, helper) {
        component.find("record").saveRecord($A.getCallback(
            function(saveResult){
                if(saveResult.state=='SUCCESS' || saveResult.state=='DRAFT'){
                    console.log('REcord save succesfully');
                }else if(saveResult.state=='INCOMPLETE'){
                    console.log('unable to save the changes');
                }else if(saveResult.state=='ERROR'){
                    console.log('ERROR:'+saveResult.error);
                    
                }else{
                    console.log('unknown error')
                }
            
            }
        )
      );
		
	},
    
handleRecordUpdated: function(component, event, helper) {
        var eventParams = event.getParams();
        if(eventParams.changeType === "CHANGED") {
            // get the fields that changed for this record
            var changedFields = eventParams.changedFields;
            console.log('Fields that are changed: ' + JSON.stringify(changedFields));
            // record is changed, so refresh the component (or other component logic)
            var resultsToast = $A.get("e.force:showToast");
            resultsToast.setParams({
                "title": "Saved",
                "message": "The record was updated."
            });
            resultsToast.fire();

        } else if(eventParams.changeType === "LOADED") {
            // record is loaded in the cache
        } else if(eventParams.changeType === "REMOVED") {
            // record is deleted and removed from the cache
        } else if(eventParams.changeType === "ERROR") {
            // there’s an error while loading, saving or deleting the record
        }
    }
})