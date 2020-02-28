({
placekeeperAuraIdFor: function(element) {
    // Hard to get from DOM back to aura:id so using classes as markers
    console.log(element.classList);
    var x = document.getElementsByClassName("slds-p-around--x-small");

    if (element.classList.contains('from-draggable')) return 'from-placekeeper';
    else if (element.classList.contains('to-draggable')) return 'to-placekeeper';
    else return null;
},
    
    getElement : function(component) 
    {
                var x = document.getElementsByClassName("slds-text-heading--medium");
        
                var y =[];
                var a = [];
				var i;
  
		for (i = 0; i < x.length; i++) 
        {   
            y.push(x[i].innerHTML); 
    		//console.log(x[i].innerHTML);
		}
        
        uniqueArray = y.filter(function(item, pos) {
        return y.indexOf(item) == pos;
            
}) 
        
        //console.log(uniqueArray); 
        //y.splice(13);
        //console.log(y); 
        uniqueArray.splice(0, uniqueArray.indexOf("Selected")+1);
        
        var uniqueArray =[];
        uniqueArray2= uniqueArray.filter(function(item, pos) {
        return uniqueArray.indexOf(item) == pos;
            
}) 
        //console.log(uniqueArray2);
		for (i = 0; i < y.length; i++) 
        {   
            a.push(y[i]); 
    		
		}
        var t = [];
        var uniqueArray2 =[];
        uniqueArray2 = a.filter(function(item, pos) {
        return a.indexOf(item) == pos;
            
}) 
        //console.log(uniqueArray2);
        for (i = 0; i < uniqueArray2.length; i++) 
        {   
            t.push(uniqueArray2[i]); 
    		
		}

		console.log(t);
        
         t.splice(0, t.indexOf("Selected")+1);
        console.log(t);
        if(t.length>0)
        {
            component.set("v.enableIfSelected",false); 
            component.set("v.selectedUsers",t);
        }
        else
        {
            component.set("v.enableIfSelected",true); 
            component.set("v.selectedUsers",t);
        }
         

   //alert("You clicked: " + event.getSource().get("v.label"));        
    }
   
    
})