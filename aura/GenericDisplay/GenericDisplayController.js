({
	viewRecord : function(component, event, helper) {
        var sid = component.get("v.sid");
        var viewRecordEvent = $A.get("e.force:navigateToSObject");
        if(viewRecordEvent)
        {
            viewRecordEvent.setParams({"recordId":sid});
            viewRecordEvent.fire();
        }
        else
        {
            alert("This feature is available only on LEX and salesforce1")
        }
    },
    
    
    editRecord: function(component,event,helper){  
        var sid = component.get("v.sid");
        var editRecordEvent = $A.get("e.force:editRecord");
        if(editRecordEvent)
        {
            editRecordEvent.setParams({"recordId":sid});
            editRecordEvent.fire();            
        }
        else
        {
            alert("This feature is available only on LEX and salesforce1")
        }
        
    }
		
	
})