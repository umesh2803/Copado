({
	showme : function(component, event, helper) {
		var Amount=component.find("amount").get("v.value");
        var Rate=component.find("Rate").get("v.value");
        var Year=component.find("Year").get("v.value");
        console.log('Amount'+Amount);
        var aval=parseInt(Amount);
        var rval=parseInt(Rate);
        var yval=parseInt(Year);
        
        var interest=component.get("c.calculate");
        interest.setParams({"Amount":aval,"Rate":rval,"Year":yval});
        interest.setCallback(this,function(response){
            var state=response.getState();
            console.log('state='+state)
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
               component.find("Interest").set("v.value", result);
                //component.set("v.Interest",result);
                console.log('interest='+result);
            }
        })
        $A.enqueueAction(interest);
	}
})