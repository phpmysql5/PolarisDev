({
	doInit : function(component, event, helper) 
    {
        var action = component.get("c.showData");
        action.setCallback(this,function(a)
                           {
                               component.set("v.configuration",a.getReturnValue());
                           })
        
        $A.enqueueAction(action);
		
	},
    
    onClick : function(component, event, helper)
    {
     
    var result = [];
    var c =[];
        if(component.find('checkbox'))
        {
    var check = component.find('checkbox');
    if(!Array.isArray(check))
    {
    check = [check];
	}
     
   for(var i = 0 ; i<check.length;i++)
{
    
        result.push(check[i].get("v.value"));
        
   
}

        
        console.log(result);
        if(result.size()>0)
        {
 		var action = component.get("c.updateData");
            action.setParams({
                              'result':result
                             });
 
    
        
      $A.enqueueAction(action); 
        }
	}
        
        else
        {
            alert("No fields so no record can be submitted" )
        }
    }
    
})