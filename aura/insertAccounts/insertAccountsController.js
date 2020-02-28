({
	insertContacts : function(component, event, helper) {
        
        var lastName = component.find("lastName").get("v.value");
        console.log(lastName);
        var action= component.get('c.addLastNamecontacts');
 
        action.setParams({"LastName":lastName});
        action.setCallback(this,function(a)
                           {
                               component.set('v.contacts',a.getReturnValue());
                           });
        
        $A.enqueueAction(action);
	
	}
})