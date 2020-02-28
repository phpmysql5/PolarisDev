({
	doInit : function(component, event, helper) 
    {
         var action = component.get("c.getAccount");
        var account;
        action.setCallback(this,function(a)
                           {
                               var account = a.getReturnValue();
                               
                               
                           })
        
        var action2 = component.get("c.showdata");
         action2.setCallback(this,function(a)
                           {
                               var result  = a.getReturnValue();
                               Object.defineProperty(account, result);
                               
                               component.set("v.account",a.getReturnValue());
                               
                               
                           })
        
        
        
        
        $A.enqueueAction(action2);
        
        
		
	}
})