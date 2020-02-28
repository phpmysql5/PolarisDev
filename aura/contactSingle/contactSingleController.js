({
	handleClick : function(component, event, helper) {
        
        var sObjectEvent = $A.get("e:force:navigateToSObject");
        sObjectEvent.setParams({"recordId" : component.get("v.contact.Id")});
        sObjectEvent.fire();
		
	}
})