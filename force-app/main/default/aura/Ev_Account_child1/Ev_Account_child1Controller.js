({
	show : function(component, event, helper) {
        var name=component.find("name").get("v.value");
        console.log('name'+name);
        var evt=$A.get("e.c:Event_Account");
   
        evt.setParams({"accName":name});
        console.log('event1'+evt);
        evt.fire();
        console.log('event2'+evt);
		
	}
})