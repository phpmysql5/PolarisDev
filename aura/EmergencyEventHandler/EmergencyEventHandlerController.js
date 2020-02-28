({
	dial911 : function(component, event, helper) 
    {   //Get reference to application event using
        //$A.get function
        
        var emergencyEvent = $A.get("e.c:EmergencyEvent");
        
        //set parameters
        emergencyEvent.setParams({"emergencyMessage":"House is on fire ,please help"});
        
        emergencyEvent.fire();
        
        
		
	}
})