({
    selectChange : function(component, event, helper) {
        // first get the div element. by using aura:id
        var changeElement = component.find("DivID");
        var changeElement2 = component.find("DivID2");
        
        
        //for task
        var task2 = component.find('check').get('v.name');
        console.log(task2);
        var task = component.find('check').get('v.value');
        console.log(task);
        
        //for event
        
        var event = component.find('event').get('v.value');
        console.log(event);
        
        
        
        var option  = component.find("select").get("v.value");
        console.log(option);
        
        if((task=='true'|| task ==true))
        {
            
            var action = component.get("c.getAllTasksEvents");
            action.setParams({'task':task2,
                              'option':option
                             });
            action.setCallback(this,function(a)
                               { 
								 component.set('v.wrapperObj',a.getReturnValue());
                               }),  
            $A.enqueueAction(action); 
            
            //$A.util.toggleClass(changeElement, "slds-hide");
            
            
            // by using $A.util.toggleClass add-remove slds-hide class
            
           
        } 
        
          if(event=='true'|| event ==true)
          {
            
           var a = component.get('c.eventchange');
           $A.enqueueAction(a)   
          }
     
    },
    
    eventchange:function(component, event, helper)
    {   
         //var changeElement2 = component.find("DivID2");
         var event2 = component.find('event').get('v.name');
         console.log(event2);
         var action = component.get("c.getAllTasksEvents");
            action.setParams({'task':event2,
                              'option':option
                             });
            action.setCallback(this,function(a)
                               { 
								 component.set('v.wrapperObje',a.getReturnValue());
                                 console.log(a.getReturnValue());
                               }), 
            $A.enqueueAction(action); 
        
            action.setCallback(this, function(a) {
            var info = a.getReturnValue();
    
        
		});
            //$A.util.toggleClass(changeElement2, "slds-hide");
            
        
    }
    
})