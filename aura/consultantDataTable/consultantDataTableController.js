({
	  fetchAccounts : function(component, event, helper) {
        component.set('v.attributes', [
            {label: 'Consultant Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
            {label: 'Other Skills', fieldName: 'Other_Skills__c', type: 'text'},
            {label: 'Phone', fieldName: 'Phone__c', type: 'text'},
            {label: 'Preferred Location', fieldName: 'Preferred_Location__c', type: 'text'},
            {label: 'Primary Skill', fieldName: 'Primary_Skill__c', type: 'text'},
            {label: 'Relevant Experience', fieldName: 'Relevant_Experience__c', type: 'number'},
            {label: 'Total Experience ', fieldName: 'Total_Experience__c', type: 'number'},
            
            
        ]);
        var action = component.get("c.fetchConsultants");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var records =response.getReturnValue();
                records.forEach(function(record){
                    record.linkName = '/'+record.Id;
                });
                component.set("v.consultantList", records);
            }
        });
        $A.enqueueAction(action);
    }
})