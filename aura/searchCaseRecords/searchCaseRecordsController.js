({
    doInit :  function(component, event, helper)
    {
        var actionPath = component.get("c.getPickValues");
        console.log(actionPath);
         
        
        
        actionPath.setCallback(this, function(a) {
            //component.set("v.CaseOriginTypes", a.getReturnValue());
            var pickvalues = [];
            pickvalues.push(a.getReturnValue());
            
            console.log("karthik"+ a.getReturnValue());
            var dd = a.getReturnValue();
            console.log(dd);
            component.set("v.CaseOriginTypes", dd);
            
            
            
            
            
        });
        
        //var arr = pickvalues.split(',');
        //consoloe.log(arr);
        
        
        
        //console.log(v.CaseOriginTypes)
        $A.enqueueAction(actionPath);
        
    }
    ,

    SearchCases: function(component, event, helper) {
        //var isValueMissing = searchField.get('v.validity').valueMissing;
        // if value is missing show error message and focus on field
        helper.SearchList(component, event); 
        }
    
  
    
    
    
})