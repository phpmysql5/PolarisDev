({
	handleEmergency : function(component, event, helper) 
    {
	var emergencyMessage = event.getParam("emergencyMessage");	
        alert('Ambulance received message'+emergencyMessage)
	}
})