({
	selectChange : function(component, event, helper) {
        
        //for task
        var task2 = component.find('check').get('v.name');
        console.log(task2);
        var task = component.find('check').get('v.value');
        console.log(task);
        
        //for event
        var event2 = component.find('event').get('v.name');
        console.log(event2);
        
        var event = component.find('event').get('v.value');
        console.log(event);
        
        //for note
        var note2 = component.find('note').get('v.name');
        console.log(event2);
        
        var note = component.find('note').get('v.value');
        console.log(event);
        
         //for email
        var email2 = component.find('email').get('v.name');
        console.log(event2);
        
        var email = component.find('email').get('v.value');
        console.log(event);

        var option  = component.find("select").get("v.value");
        console.log(option);
        var temp = [];
        if((task=='true'|| task ==true))
        {
            temp.push(task2);
        }
        
        if((event=='true'|| event ==true))
        {
                
            temp.push(event2);
            
        }
        
        if((note =='true'|| note == true))
        {
                
            temp.push(note2);
            
        }
        
         if((email =='true'|| email == true))
        {
                
            temp.push(email2);
            
        }
        
        
             
            console.log(temp); 
            if(temp.length> 0 && option!="" )
            {
            var action = component.get("c.getAllTasksEvents");
            action.setParams({
                              'temp':temp,
                              'objectApi':option
                             });
            action.setCallback(this,function(a)
                               { 
                                   var info = a.getReturnValue();
								   if (a.getState() === "SUCCESS") 
                                   {
      									  component.set("v.wrapperObj", info);
    							   } 
                                   else if (a.getState() === "ERROR") 
                                   {
                                         
       									 $A.log("callback error", a.getError());
   								   }

                               }),  
            $A.enqueueAction(action); 
            }
        
        if(temp.length == 0 && option!="" )
            {
            var action = component.get("c.getAllTasksEvents");
            action.setParams({
                              'temp':temp,
                              'objectApi':option
                             });
            action.setCallback(this,function(a)
                               { 
                                   var info = a.getReturnValue();
								   if (a.getState() === "SUCCESS") 
                                   {
      									  component.set("v.wrapperObj", info);
    							   } 
                                   else if (a.getState() === "ERROR") 
                                   {
                                         
       									 $A.log("callback error", a.getError());
   								   }

                               }),  
            $A.enqueueAction(action); 
            }
            //$A.util.toggleClass(changeElement, "slds-hide");
            
            
            // by using $A.util.toggleClass add-remove slds-hide class
            
           
         
        
          //if(event=='true'|| event ==true)
          //{
            
           //var a = component.get('c.eventchange');
           //$A.enqueueAction(a)   
          //}
     
    }
})