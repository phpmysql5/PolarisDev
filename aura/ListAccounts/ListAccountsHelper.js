({
	helperMethod : function(component) {
        var action = component.get("c.getAccountList");
        action.setCallback(this,function(a)
                           {
                               
                               component.set("v.acco",a.getReturnValue());

                           });
		
        $A.enqueueAction(action);		
	}
})