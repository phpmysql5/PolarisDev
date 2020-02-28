({
	save : function(component, event, helper) 
    {
        var newContact = component.get("v.newContact");
        helper.callServer(component,"c.createContact","v.status",{"con":newContact});
        
		
	},
    
    validateLastName : function(component,event,helper)
    {
    var newContact = component.get("v.newContact");
    var btn = component.find("btn");
    if(newContact.LastName.length>=2)
    {
    btn.set("v.disabled",false);
	}
        else
        {
            btn.set("v.disabled",true);
        }
	},
    
    refreshForm : function(component,event,helper)
    {
        //component.set("v.newContact.FirstName","");
        //component.set("v.newContact.LastName","");
        //component.set("v.newContact.Email","");
        component.set("v.newContact",{"sObjectType":"Contact"})
        
    }
})