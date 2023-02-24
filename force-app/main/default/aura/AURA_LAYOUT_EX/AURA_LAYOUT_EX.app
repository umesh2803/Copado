<aura:application extends="force:slds" >
	
    <lightning:layout multipleRows="true" >
      
        <lightning:layoutItem flexibility="auto" padding="around-small" size="12">
           <div>
          <lightning:card >
              <aura:set attribute="title">
           <lightning:avatar fallbackIconName="standard:person_account" alternativeText="account" />
            Account
               </aura:set>
              <aura:set attribute="actions" >
              <lightning:buttongroup>
                  <lightning:button label="save"/>
                  <lightning:button label="cancel"/>
              </lightning:buttongroup>
             </aura:set>
              
              <div class="slds-p-horizontal_large"><b>Name : Wipro &nbsp; &nbsp;   Industry : Banking </b></div> 
          
          </lightning:card>
         </div>
        </lightning:layoutItem>
        
       <lightning:layoutItem flexibility="auto" padding="around-small" size="5">
          <div class="slds-theme_shade slds-theme_alert-texture"> 
          <lightning:card  >
          <p class="slds-p-horizontal_large slds-align_absolute-left "><b>Name</b>  :  Umesh</p>
          <p class="slds-p-horizontal_large slds-align_absolute-left "><b>City</b>   :  Pune</p>
          <p class="slds-p-horizontal_large slds-align_absolute-left "><b>Status</b> :  Active</p>
          </lightning:card>
      </div>
        </lightning:layoutItem>
        
       <lightning:layoutItem flexibility="auto" padding="around-small" size="6">
       <div>
          <lightning:card title="Account" >
          <p class="slds-p-around_x-small">BODY1</p>
          </lightning:card>
      </div>
        </lightning:layoutItem>
         
    </lightning:layout>
      
</aura:application>