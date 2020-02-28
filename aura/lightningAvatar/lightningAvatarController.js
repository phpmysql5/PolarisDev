({
	doInit : function(component, event, helper) {
        
          var appEvent = component.getEvent("appEvent");
        appEvent.setParams({
            "message" : "An application event fired me."});
        appEvent.fire();
     
        
        
		
	}
})