({
	doInit : function(component, event) {
        var action = component.get("c.findAll");
        
        action.setCallback(this, function(a) {
            component.set("v.user", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    afterDragulaLoaded: function(component, event, helper) {
 
    // Components
    var container = component.find('container');
    var from = component.find('from-draggable');
    var to = component.find('to-draggable');
    //console.log(component.find('to-placekeeper'));
 
    // Dragula needs the DOM elements
    var drake = dragula([from.getElement(), to.getElement()], {
        direction: 'vertical',
        mirrorContainer: container.getElement()
        
    });
 
    // Show/hide the "Drag and Drop Here" item
    // $A.getCallback makes safe to invoke from outside the Lightning Component lifecycle
    drake.on('drop', $A.getCallback(function(el, target, source, sibling) {
        console.log(source.children);
        if (source.children.length <= 1) {
            $A.util.removeClass(component.find(helper.placekeeperAuraIdFor(source)), 'slds-hide');
        }
         console.log(sibling);
        $A.util.addClass(component.find(helper.placekeeperAuraIdFor(target)), 'slds-hide');
        helper.getElement(component);
        

    }));
},
    sendMail: function(component, event, helper)
    { 
      
        component.set("v.isOpen", true);
     }
    
    ,
 closeModel: function(component, event, helper) 
    {
          var selectedUsers =component.get('v.selectedUsers');
          console.log(selectedUsers);
            
        //var options = component.find('options');
        //console.log(options);
        var amount = component.find('cake').get('v.value');
        console.log(amount);
         var name2 = component.find('name2').get('v.value');
        console.log(name2);
        
        var action = component.get("c.sendMail2");

        
        
        
        
        // in the server-side controller
       
        
      var d = component.find("today").get('v.value');
      alert(component.find('radioG').get('v.value'));
        action.setParams({"users" : selectedUsers,'options':component.find('radioG').get('v.value'),"amount": amount,"person": name2,
                          'time2': $A.localizationService.formatDate(d, "MMMM dd yyyy, hh:mm:ss a")});
        
        // Create a callback that is executed after 
        // the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
        });
        $A.enqueueAction(action);
        component.set("v.isOpen", false);
        
}
    
    
})