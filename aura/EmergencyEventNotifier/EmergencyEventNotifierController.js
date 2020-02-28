({
	handleEmergency : function(component, event, helper) 
    {
	var emergencyMessage = event.getParam("emergencyMessage");	
        alert('Fire brigade received message'+emergencyMessage)
	}
})