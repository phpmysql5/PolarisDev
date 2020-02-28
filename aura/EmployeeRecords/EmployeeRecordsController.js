({
	onclick : function(component, event, helper) {
		var check = component.find("checkbox2").get("v.value"); 
        console.log(check);
        var firstName =component.find("FirstName").get("v.value");
        console.log(firstName);
        var lastName = component.find("LastName").get("v.value");
        console.log(lastName);
        var age = component.find("Age").get("v.value");
        console.log(age);
        
        var action= component.get("c.showRecentEmployeeRecords");
        var action2 = component.get("c.showEmployeeRecords");
        action.setParams({"IsExperienced":check,
            "age":age,"LastName":lastName,
                          "FirstName":firstName
                         
                          });
        action.setCallback(this,function(a)
                           {
                               component.set("v.RecentEmp",a.getReturnValue());
                           }),
            
        action2.setCallback(this,function(a)
                           {
                               component.set("v.showAllrecords",a.getReturnValue());
                           }),
            
            $A.enqueueAction(action);
        $A.enqueueAction(action2);
        
      

        
        
        
        
		
	},
    
    doInit : function(component)
    {
        var action = component.get("c.showEmployeeRecords");
        action.setCallback(this,function(a)
                           {
                               component.set("v.showAllrecords",a.getReturnValue());

                           }),
            $A.enqueueAction(action);
        
    }
,    
    onEdit : function(component)
    {
        var rowId = component.get("button");
        console.log(rowId);
        var action = component.get("c.editTheRecord");
        action.setParams({"employeeId": rowId});
       action.setCallback(this,function(a)
                           {
                               //component.set("v.editTheRecord",a.getReturnValue());
                               component.find("FirstName").set("v.value","karthik");
                           })
        
        $A.enqueueAction(action);
        
        
    }
 
    
})