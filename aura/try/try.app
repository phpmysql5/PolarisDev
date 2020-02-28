<aura:application extends="force:slds">
    <!--c:insertPaidAmount></c:insertPaidAmount-->
    <!--c:createNewColleague></c:createNewColleague-->
    <lightning:tabset variant="vertical">
        <lightning:tab label="Send Invitation">
        <c:SampleDragDrop></c:SampleDragDrop>
        </lightning:tab>
        <lightning:tab label="Add Payments">
           <c:insertPaidAmount></c:insertPaidAmount>
        </lightning:tab>
        <lightning:tab label="Item Three">
            Content in Tab Three
        </lightning:tab>
    </lightning:tabset>
</aura:application>