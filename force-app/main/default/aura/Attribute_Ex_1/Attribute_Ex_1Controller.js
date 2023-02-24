({
	show : function(component, event, helper) {
		
        var currentformFactor=$A.get("$Browser.formFactor");
        console.log('FORM-'+currentformFactor);
        helper.logger(component, event, helper);
        component.set("v.value", true);
        
        
	},
    change : function(component, event, helper){
        var header=$A.get("$Label.c.On_click");
        component.set("v.name", header);
      //component.set("v.name", $A.get("$Label.c.On_click"));custom setting.
       // component.set("v.name", 'you have changed date');
        
        
        
    }
})