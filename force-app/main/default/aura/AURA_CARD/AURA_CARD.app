<aura:application extends="force:slds">
	<lightning:card >
    	<aura:set attribute="title" >
            <lightning:avatar fallbackIconName="standard:person_account" alternativeText="account" />
            Account &nbsp;&nbsp;&nbsp;
            <lightning:buttonIcon iconName="utility:down" variant="border-filled" alternativeText="Show More"/>
        </aura:set>
        <aura:set attribute="actions" >
            <lightning:button label="save" />
        </aura:set>
        <aura:set attribute="footer" >
          copy@right Salesforce
        </aura:set>
    </lightning:card>
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    <lightning:card title="Account" footer="copy@right" variant="Narrow">
       
          <p class="slds-p-horizontal_large" >  </p> 
            Card Body (custom component)
      
           <lightning:buttonIcon iconName="utility:down" variant="border-filled" alternativeText="Show More"/>
       
    </lightning:card>
</aura:application>