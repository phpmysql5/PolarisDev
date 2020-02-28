({
	handleSelect : function(component, event, helper) {
        var selectedItemValue = event.getParam("value");
        //alert(selectedItemValue + " feature is not available...");
        
        //$A.createComponent() function
        //arguments 1.Name of the component along with name space
        //			2.attributes injson format
        //			3.js function which will get executed immediately
        //			after creating the component
        $A.createComponent("c:ModalExample",{"title":"Info Message",
                                             "body" : "This feauture is not available"},
                          function(myBox)
                           {
                               //1.Get reference to ModalDiv
								var modalDiv = component.find("modalDiv");
                               //2.Get copy of modalDiv's body
                               var modalDivBody = modalDiv.get("v.body")
                               //3.Push myBox into copy 
                               modalDivBody.push(myBox);
                               //4.Set original modalDiv's body with copy
                               modalDiv.set("v.body",modalDivBody);
                           });
		
	}
})