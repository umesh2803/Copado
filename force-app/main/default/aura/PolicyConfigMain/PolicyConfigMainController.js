({

        
    invoke : function(component, event, helper){
        
       // var result=confirm("want to show?")
        //if(result)
            component.set("v.SelectedAccount",event.getSource().get("v.value"));
            component.find("recordLoader").reloadRecord();
     
    },
    changevalue : function(component, event, helper){
        var conson=component.get("v.check");
        if(conson==true){
            component.set("v.check",false);
        }else{
            component.set("v.check",true);
        }
        
    },
    
   /* ParentRefresh : function(component, event, helper){
        component.find("AURAmethod");
        component.setParams({"v.SelectedAccount":null},
                            {"v.Selectedpolicy":null});
        
    }
        */
    
    handleload : function(component, event, helper){
        component.find("premiumfield").set("v.value",0);  //It will set the value of premium 0. on load
    },
    
    handlesuccess : function(component, event, helper){
        
       var insurancepolicyID=event.getParam("response");
       alert(insurancepolicyID.id);
      var getmilestone =component.get("c.milestoneinsert");
      getmilestone.setParams({
        policyid : component.get("v.Selectedpolicy"),
        premium : component.find("premiumfield").get("v.value"),
        renewal :component.find("renewal").get("v.value"),
        insuranceid : insurancepolicyID.id
      });
      getmilestone.setCallback(this,function(res){
          var state=res.getState();
          console.log(state);
          if(state='SUCCESS'){
              var navigate = $A.get("e.force:navigateToSObject");
              navigate.setParams({
                  "recordId" : insurancepolicyID.id
              });
              navigate.fire();
          }
      });
      $A.enqueueAction(getmilestone);
    },
   
    
    
        handlesubmit : function(component, event, helper){
       event.preventDefault();
       var isValidate = true;
       
       var premiumfield = component.find("premiumfield");
       var premium1=component.find("premiumfield").get("v.value"); 
       var check=component.find("checkin");
        var milecheck=component.get("v.milecheck");
             var conson=component.get("v.check");
         if(premium1 < 10000){
         component.find("message").setError("premium");    
             
         helper.showToastMessage(component, event, helper, "Configuration", "Premium should be greater than 10000.", "info", 5000);
         }else if(conson==false){
              check.setCustomValidity('wrong'); 
              check.reportValidity();
         }else if(milecheck==false)
           helper.showToastMessage(component, event, helper, "Configuration", "check milestone button before saving record.", "error", 5000);
          else{
            component.find("recordEdit").submit();
            helper.showToastMessage(component, event, helper, "Configuration", "record saved successfully.", "success", 5000);
        }
           
     
    },
    resethandle : function(component, event, helper){
        var evt=component.getEvent("reset");
        evt.setParams({
            reset : true 
        });
        evt.fire();
        
    },
    
    Totalpolicyhandle : function(component, event, helper){
        var mile=$A.get("e.c:milestone_event");
        mile.setParams({
            policyID : component.get("v.Selectedpolicy"),
            premium  : component.find("premiumfield").get("v.value"),
            renewal  : component.find("renewal").get("v.value")
        });
        mile.fire();
        component.set("v.milecheck",true);
  
    }
})