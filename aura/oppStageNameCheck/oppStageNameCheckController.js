({
	recordUpdate: function(component, event, helper) {
        var sdd = component.get("v.record").StageName;
        
        if(sdd=='Qualification')
        {
     
        component.set('v.AlertMessage','adfdff');
        //alert('asas');
        }
        
        else
        {
           $A.get("e.force:closeQuickAction").fire();

    
        }}
})