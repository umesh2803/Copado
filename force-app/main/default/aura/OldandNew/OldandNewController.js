({
    changeValue : function (component, event, helper) {
      component.set("v.myBool", false);
    },

    handleValueChange : function (component, event, helper) {
        alert("old value: " + event.getParam("oldValue"));
        alert("current value: " + event.getParam("value"));
    }
})