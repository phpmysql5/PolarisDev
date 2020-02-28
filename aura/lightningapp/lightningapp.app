<aura:application extends='force:slds' >
	
   
        <c:testAttribute/>
      
 <lightning:tabset selectedTabId="three">

        <lightning:tab label="Item Two" id="two">       
           
            <c:testAttribute/>       
            
        </lightning:tab>
        <lightning:tab label="Item one" id="three">         
           <c:Child/>       
            
            
        </lightning:tab>
 
     
        
    </lightning:tabset>
    
    
</aura:application>