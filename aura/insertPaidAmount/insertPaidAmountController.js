({
	doInit : function(component, event, helper) {        
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name',  type: 'text'},
            {label: 'Paid Amount', fieldName: 'Paid_Amount__c', editable:'true', type: 'number'},
            {label: 'Pending Amount', fieldName: 'Pending_Amount__c',  type: 'number'}
        ]);        
        helper.getAccounts(component, helper);
    },

    /*
     * This function is calling saveDataTable helper function
     * to save modified records
     * */
    onSave : function (component, event, helper) {
        helper.saveDataTable(component, event, helper);
    }
})