({
    goToRecord : function(component, event, helper) {
        // Fire the event to navigatehttps://saddahaq-dev-ed.my.salesforce.com/_ui/common/apex/debug/ApexCSIPage# to the contact record
        var sObjectEvent = $A.get("e.force:navigateToSObject");
        sObjectEvent.setParams({"recordId": component.get("v.contact.Id")})
        sObjectEvent.fire();
    }
})