<aura:application >
    <aura:attribute name="values"
                    type="String[]"
                    access="private" />
    <aura:attribute name="dragid"
                    type="Integer"
                    access="private" />
    <aura:handler name="init"
                  value="{!this}"
                  action="{!c.doInit}" />
    <div class="droparea" 
         ondragover="{!c.cancel}" 
         ondragenter="{!c.cancel}"
         ondrop="{!c.drop}">
        <aura:iteration items="{!v.values}"
                        indexVar="index"
                        var="value">
            <div class="row" 
                 draggable="true"
                 ondragstart="{!c.dragstart}"
                 data-drag-id="{!index}">
                {!value}
            </div>
        </aura:iteration>
    </div>
</aura:application>