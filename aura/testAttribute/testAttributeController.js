({
 
    
    handleApplicationEvent : function(cmp, event) {
        
        var message = event.getParam("message");

        // set the handler attributes based on event data
 
        cmp.set("v.Parent",message);
        
        alert('sssssssss in second event' + message);
        var numEventsHandled = parseInt(cmp.get("v.numEvents")) + 1;
        cmp.set("v.numEvents", numEventsHandled);
    }
})