({
    
      doInit:function(component,event,helper){
        console.log('sd');
        var actionPath1 = component.get("c.loadLockStatusPath1");
        console.log(actionPath1);
        
        
        actionPath1.setCallback(this, function(a) {
            component.set("v.carouselPath1", a.getReturnValue());
        });
        $A.enqueueAction(actionPath1);
        
        var actionPath2 = component.get("c.loadLockStatusPath2");
        console.log(actionPath2);
        
        
        actionPath2.setCallback(this, function(a) {
            component.set("v.carouselPath2", a.getReturnValue());
        });
        $A.enqueueAction(actionPath2);
          
	}
  ,
     onRightNID :function(component,event,helper){
        console.log('sd');

        var action2 = component.get("c.checkNID");
        console.log(action2);
        action2.setParams({"NID" : component.find('NID').get('v.value'),
                           "Branch":component.find('select').get('v.value') });
        
        action2.setCallback(this, function(a) {
             console.log(a.getReturnValue());
            if(a.getReturnValue()=='CurrentNID')
            {
            component.set("v.currentNID", false); 
            }
             else
            {
                 component.set("v.currentNID", true); 
            }
            
             if(a.getReturnValue()=='CorrectNID')
            {
            component.set("v.correctNID", false); 
            }
            else
            {
                 component.set("v.correctNID", true); 
            }
        });
    
          $A.enqueueAction(action2);
         console.log(component.get('v.correctNID'));
         
         
        
        //component.set('v.options',['jan','feb','mar']);
        //component.find('myselection').set('v.value','feb');
	}
,

    handleLock : function(component, event, helper) {
        //component.set("v.isOpen", true);
        
        var NID = component.find('NID').get('v.value');
        var action = component.get("c.checkToLock");
        
         action.setParams({"NID" : component.find('NID').get('v.value'),
                           "Branch":component.find('select').get('v.value') });
        
        action.setCallback(this, function(a) {
              var state = a.getState();
            component.set("v.Message", a.getReturnValue());
             var nidValue = component.find("NID"); 
 
         nidValue.set('v.value',null); 
         component.set('v.correctNID',true);  
         component.set('v.currentNID',true);    
         
            
        });
        $A.enqueueAction(action);
        helper.reloadCarousel(component);
       
        
		
	},
    
    handleUnlock : function(component, event, helper) {
        
        var NID = component.find('NID').get('v.value');

        var action = component.get("c.checkToUnlock");
        
         action.setParams({"NID" : component.find('NID').get('v.value'),
                           "Branch":component.find('select').get('v.value') });
         
        
        action.setCallback(this, function(a) {
            var state = a.getState();
            console.log(state);
            component.set("v.Message", a.getReturnValue());
            
         var nidValue = component.find("NID");    
         nidValue.set('v.value',null); 
        component.set('v.correctNID',true);  
        component.set('v.currentNID',true);    
            
         
        });
        $A.enqueueAction(action);
        helper.reloadCarousel(component);
        
        
		
	},
    
    onChangeOfPicklist: function(component, event, helper) {
        
        component.set('v.correctNID',true);  
        component.set('v.currentNID',true);  
        var nidValue = component.find("NID"); 
        nidValue.set('v.value',null); 
    
        
    }
    
       //handleEmergencyLock : function(component, event, helper) {
        //component.set("v.isOpen", true);
        
       // var NID = component.find('NID').get('v.value');
        //var action = component.get("c.checkToLock");
        
        // action.setParams({"NID" : component.find('NID').get('v.value'),
         //                  "Branch":component.find('select').get('v.value') });
        
     //   action.setCallback(this, function(a) {
            //  var state = a.getState();
          //  component.set("v.Message", a.getReturnValue());
         //    var nidValue = component.find("NID"); 
 
       //  nidValue.set('v.value',null); 
       //  component.set('v.correctNID',true);  
       //  component.set('v.currentNID',true);    
         
            
       // });
      //  $A.enqueueAction(action);
    //    helper.reloadCarousel(component);
	
	//}
})