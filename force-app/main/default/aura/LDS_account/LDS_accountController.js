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
		
	}
})