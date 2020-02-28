({
	getAllaccounts : function(component, event, helper) {
        helper.callServer(component,'c.getAllAccounts','v.accountList');
		
	},
    getAllaccountsApparel : function(component, event, helper) {
        helper.callServer(component,'c.getAllAccountsofApparel','v.accountList');
		
	}
})