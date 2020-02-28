({
    doInit : function(component, event, helper) {
        
    },
    navigate : function(component, event, helper) {
        var nagigateLightning = component.find('navigate');
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'list'
            },
            state: {
                filterName: 'MyAccounts'
            } 
        };
        nagigateLightning.navigate(pageReference);
    }
})