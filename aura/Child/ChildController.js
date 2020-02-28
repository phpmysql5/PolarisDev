({
	/* aeHandlerController.js */

    handleComponentEvent: function(cmp, event) {
        var message = event.getParam("message");
        
     alert('sssssssss in third event' + message);
        // set the handler attributes based on event data
        cmp.set("v.Parent2",message+'sdsd');
        alert(message);
        var numEventsHandled = parseInt(cmp.get("v.numEvents")) + 1;
        cmp.set("v.numEvents", numEventsHandled);
    }

})