({
    showToastMessage : function(component, event, helper, toastTitle, toastMessage, toastType, toastDuration) {
        var toast = $A.get("e.force:showToast");
        toast.setParams({
            "title": toastTitle,
            "message": toastMessage,
            "type": toastType,
            "duration": toastDuration
        });
        toast.fire();
    }
})