({
	reloadCarousel : function(component) {
        

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
		
	
})