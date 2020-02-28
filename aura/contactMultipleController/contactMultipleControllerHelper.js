({
	loadContactRecords : function(component) {
        
        var action = component.get("c.getContacts");		
		action.setCallback(this,function(response)
        {
        var state = response.getState();
        if(state ==="SUCCESS")
        {
            cmp.set("v.contacts", response.getReturnValue());
            cmp.set("v.contactList", response.getReturnValue());
            this.updateTotal(cmp);
        }
        });
    },
    
    updateTotal : function(component)
    {
        var contacts = cmp.get("v.contacts");
		cmp.set("v.totalContacts", contacts.length);
        
    }
})