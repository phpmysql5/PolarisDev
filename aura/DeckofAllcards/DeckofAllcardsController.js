({
	handleClick : function(component, event, helper) {
        //loop through all the buttons and set their 
        //variant as 'Neutral'
        
        for(var i=1;i<=2;i++)
        {
            var btn = component.find(i);
            btn.set("v.variant","neutral");
        }
        
        var buttonClicked = event.getSource();
        var buttonClickedLabel = buttonClicked.get("v.label");
        //alert(' You have clicked '+buttonClickedLabel)
        buttonClicked.set("v.variant","brand");
        
        var talkingDiv = component.find('talkingDiv');
        var angryDiv = component.find('angryDiv');
        
        //check which button has been clicked
        if(buttonClickedLabel=="TalkingParrot")
        {
            $A.util.addClass(angryDiv,"slds-hide");
            $A.util.removeClass(talkingDiv,"slds-hide");
        }
        else
        {
            $A.util.addClass(talkingDiv,"slds-hide");
            $A.util.removeClass(angryDiv,"slds-hide");
            
        }
		
	}
})