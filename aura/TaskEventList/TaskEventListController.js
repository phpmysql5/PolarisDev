({
	
      handleChange: function (component, event, helper) {
       
        //alert(event.getParam('value'));
        var task = component.find('task').get("v.value");
        console.log(task);
          
        var objectApi = event.getParam('value');
        console.log(objectApi);
        var action = component.get("c.getAllTasksEvents");
        action.setParams({"objectApi":objectApi});
        action.setCallback(this,function(a)
                          { 
                          component.set('v.taskList',a.getReturnValue());
                           }),  
          
        $A.enqueueAction(action);   
        /*var action2 = component.get("c.getAllTasksEvents");
        action2.setParams({"objectApi":objectApi});
        action2.setCallback(this,function(a)
                          { 
                          component.set('v.eventList',a.getReturnValue());
                           })

        $A.enqueueAction(action2);
        
        
        */
    }
})