({
	locationChange : function(component, event, helper) {
        var token = event.getParam("token");
        if(token!=null)
        {
        if(token.indexOf('account/')===0)
        {
            var AccountId =token.substr(token.indexOf('/')+1);
            console.log( AccountId);
            var action = component.get('c.getContactList');
            action.setParams({"AccountId":AccountId});
            
            action.setCallback(this,function(a)
                               {
                                   component.set("v.contacts",a.getReturnValue());
                                   
                                              
                                   
                               });
            $A.enqueueAction(action);
            

        }
      }
		
	}
})