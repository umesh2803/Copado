({
	invoke : function(component, event, helper) {
       
        var year=component.get("v.year");
        console.log('year :'+year);
        var Amount=0;
        var Rate_of_Interest=0;
        if(year > 5){
            Rate_of_Interest=10;
            Amount=Rate_of_Interest*1000;
        }else{
            Rate_of_Interest=20;
            Amount=Rate_of_Interest*2000;
        }
       
		component.set("v.Amount",Amount);
        component.set("v.Rate_of_Interest",Rate_of_Interest);
      
        console.log('Rate_of_Interest :'+Rate_of_Interest);
        console.log('Amount :'+Amount);
	}
})