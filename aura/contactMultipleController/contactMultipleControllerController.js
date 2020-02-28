({
    doInit: function(component, event, helper) 
    {
        helper.loadContactRecords(component);
    }
    
    ,
    onChange : function(component, event, helper) 
    {
        var contacts = component.get("v.contacts");
		var contactList = component.get("v.contactList");
		//Get the selected option: "Referral", "Social Media", or "All"
		//var selected = event.getSource().get("v.value");
		//
		var selected = event.getSource().get("v.value");
        
      var filter = [];
var k = 0;
for (var i=0; i<contactList.length; i++){
var c = contactList[i];
if (selected != "All"){
if(c.LeadSource == selected) {
filter[k] = c;


k++;
}
}
else {
filter = contactList;
}
}
//Set the filtered list of contacts based on the selected option
component.set("v.contacts", filter);
helper.updateTotal(component);
}        
        
        
        
        
     
        
		
	
})