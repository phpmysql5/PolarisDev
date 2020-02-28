({
	handleClick : function(component, event, helper) {
        //loop through all the buttons and set their 
        //variant as 'Neutral'
        
        for(var i=1;i<=4;i++)
        {
            var btn = component.find(i);
            btn.set("v.variant","neutral");
        }
        
        var buttonClicked = event.getSource();
        var buttonClickedLabel = buttonClicked.get("v.label");
        //alert(' You have clicked '+buttonClickedLabel)
        buttonClicked.set("v.variant","brand");
		
	}
})