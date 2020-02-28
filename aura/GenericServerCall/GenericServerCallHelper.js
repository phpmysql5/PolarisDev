({
	callServer : function(component,methodName,attributeName,params) 
    {
        var methodRef = component.get(methodName);
        
        //2.SET THE PARAMETERS,if any
        
        
        if(params)
        {
            methodRef.setParams(params);
        }
                                      
        
        
        
       
        methodRef.setCallback(this,function(response)
                              {
                                  var state = response.getState();

                                  var result = response.getReturnValue();
                                  component.set(attributeName,result)
                                 
                              });
        
        
        
        
        
        
        
        //2. Put this method call in queue using
        $A.enqueueAction(methodRef);
    }
        
		

})