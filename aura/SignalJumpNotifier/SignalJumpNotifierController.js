({
	notifySignalJump : function(component, event, helper) 
    {
        //1.Get reference to event
        var signalJump = component.getEvent("signalJump");
        
        //2.Set params
        signalJump.setParams({"msg":"Rohit jumped signal"});
        
        //3.fire the event
        signalJump.fire();
        
		
	}
})