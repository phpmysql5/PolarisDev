({
    locationChange : function(component, event, helper) {
        var token = event.getParam("token");
        console.log(token);
        if(token != null){
       if ( token.indexOf('contact/') === 0)  {
            var contactId = token.substr(token.indexOf('/') + 1);
            console.log(contactId);
            var action = component.get("c.findById");
            action.setParams({
              "contactId": contactId
            });
            action.setCallback(this, function(a) {
                component.set("v.contact",a.getReturnValue());
               
            });
            $A.enqueueAction(action);
        }
        }}
})