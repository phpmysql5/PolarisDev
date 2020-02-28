({
	addition : function(component, event, helper) {
        var num1 = parseInt(component.get("v.num1"));
        var num2 = parseInt(component.get("v.num2"));
        var result = num1 + num2;
        //alert('Inside addition '+result)
        
        component.set("v.result",result);
        
        
		
	},
    substraction : function(component, event, helper) {
       var num1 = parseInt(component.get("v.num1"));
        var num2 = parseInt(component.get("v.num2"));
        var result =num1-num2;
       // alert('Inside substraction'+ result);
       component.set('v.result',result);
        
		
	},
     multiplication : function(component, event, helper) {
        var num1 = parseInt(component.get("v.num1"));
        var num2 = parseInt(component.get("v.num2"));
        var result =num1*num2;
        //alert('Inside multiplcation '+ result);
        component.set('v.result',result);
         
        
		
	},
    
      division : function(component, event, helper) {
         var num1 = parseInt(component.get("v.num1"));
         var num2 = parseInt(component.get("v.num2"));
          var result = num1/num2;
          //alert('Inside division'+result);
          component.set('v.result',result);
          
          
	}
    
})