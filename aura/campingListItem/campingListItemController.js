({
	packItem : function(component, event, helper) 
    {
        
        var btnClicked = event.getSource();
        btnClicked.set('v.disabled',true);
        var vItem = component.get('v.item');
        vItem.Packed__c = true;
        component.set('v.item',vItem);
        
	
	}
})