({
	helperMethod : function(strtitle,strmessage,intduration,strtype) {
         var toastEvent=$A.get("e.force:showToast");
            toastEvent.setParams({
                "title":strtitle,
                "message":strmessage,
                "duration":intduration,
                "type":strtype
            });
            toastEvent.fire();

		
	}
})