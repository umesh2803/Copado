({
	addme : function(component, event, helper) {
        var firstname=component.find("fname").get("v.value");
        var lastname=component.find("lname").get("v.value");
        var name=firstname+lastname;
        console.log('fname='+fname);
        console.log('lname='+lname);
        
        component.find("Name").set("v.value",name);
        
        
        
        
        
		
	}
})