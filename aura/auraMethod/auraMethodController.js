({
    callBtn : function(component, event, helper) {
     component.compMtd();
    },
       callFromCompMetd : function(component, event, helper) {
           var params = event.getParam('arguments');
           if (params) {
               var param1 = params.Str;
         alert(param1);
           }
    }
   })