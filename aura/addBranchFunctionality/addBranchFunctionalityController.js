({
	addBranch : function(component, event, helper) {
         var actionPath1 = component.get("c.addBranchMetadata");
        console.log(actionPath1);
        
        
        actionPath1.setCallback(this, function(a) {
            //component.set("v.carouselPath1", a.getReturnValue());
            
        });
        $A.enqueueAction(actionPath1);
        
        
		
	}
})