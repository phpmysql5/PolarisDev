({
	getRecordsList : function(component) {
        console.log("Student_Records_cmpHelper:entered");
        var action = component.get("c.getRecords");
        
        var self= this;
        action.setCallback(this, function (actionResult)
                           { var state = actionResult.getState();
                            console.log(state);
                            component.set("v.records",actionResult.getReturnValue());
                            component.set("v.records.FirstName",actionResult.getReturnValue());
                                 
                           }
		);
        
        $A.enqueueAction(action);
        console.log("Student_Records_cmpHelper:exit")
	}
})