({
	setOutput : function(component, event, helper) {
        
       var cmpmsg = component.find("msg");
        $A.util.removeClass(cmpMsg,'hide');
         var karthik = component.find('karthik').get("v.value");
         var oTextArea = component.find('oTextarea');
        oTextArea.set("v.value",karthik);

	}
})