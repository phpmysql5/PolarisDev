({
	doInit : function(component, event, helper) {
        console.log("Student_Records_cmpController.doInit:entered");
        helper.getRecordsList(component);
        console.log("Student_Records_cmpController.doInit:exit");
        
		
	},
})