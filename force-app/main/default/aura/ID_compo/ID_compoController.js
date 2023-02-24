({
	show : function(component, event, helper) {
        var num1=component.find("aval").get("v.value");
        var num2=component.find("bval").get("v.value");
        var result=parseInt(num1)+parseInt(num2);
        console.log('number1 :'+num1);
        console.log('number2 :'+num2);
        
        component.find("Result").set("v.value",result);
        
		
	},
    call :  function(component, event, helper) {
        var num1=component.find("aval").get("v.value");
        var num2=component.find("bval").get("v.value");
        var result=parseInt(num1)*parseInt(num2);
        console.log('number1 :'+num1);
        console.log('number2 :'+num2);
        
        component.find("Result").set("v.value",result);
    }
})