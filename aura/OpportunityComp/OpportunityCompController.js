({
	    
    getAllOps : function(component, event, helper) 
    {
       component.display();
       helper.callServer(component,"c.getAllOpportunities","v.oppList");
        
    },
    
    getAllWonOps : function(component,event,helper)
    {  component.display();
        helper.callServer(component,"c.getAllOpportunitiesClosedWon","v.oppList")
    },
    
    displayToast: function(component,event,helper)
    {
        var toastEvent = $A.get("e.force:showToast");
        if(toastEvent)
        {
            toastEvent.setParams({"title":"Success Message",
                                  "message":"Opportunities are getting loaded"
                                  ,"type":"success"});
            toastEvent.fire();
        }
        else
        {
            alert("Opportunities are not getting loaded");
        }
    },
    
    showspin:function(component,event,helper)
    {
    var spin = component.find("spin");
    $A.util.removeClass(spin,"slds-hide");
    },
 
 hidespin: function(component,event,helper)
{
    var spin = component.find("spin");
    $A.util.addClass(spin,"slds-hide");
}

        

})