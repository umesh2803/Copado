<aura:application extends="force:slds">
    <div class="slds-theme_alert-texture">
    <lightning:layout multipleRows="true">
        <lightning:layoutItem size="12" padding="around-small" flexibility="auto">
        <lightning:card>
            <aura:set attribute="title">  
                <lightning:avatar fallbackIconName="standard:account" alternativeText="umesh" size="Large" />
                 ICICI APPLICATION
            </aura:set>
             <aura:set attribute="actions">
                              
            <lightning:buttonGroup>
		 <lightning:button variant="neutral" label="Login" />
		 <lightning:button variant="neutral" label="Sign UP" />
            </lightning:buttonGroup>
            </aura:set>          
            </lightning:card>
      
        </lightning:layoutItem>
       
        <lightning:layoutItem size="12" class="slds-card" padding="around-small" flexibility="auto">
       <lightning:recordViewForm recordId="0015g00000QT13cAAD" objectApiName="Account">
        <div class="slds-box">
            <lightning:outputField fieldName="Name" />
            <lightning:outputField fieldName="Phone" />
            <lightning:outputField fieldName="Rating" />
            <lightning:outputField fieldName="Type" />
            <lightning:outputField fieldName="Ownership" />
            <lightning:outputField fieldName="Billing Address" />
        </div>
    </lightning:recordViewForm>
        </lightning:layoutItem>
       
        <lightning:layoutItem size="12" class="slds-card" padding="around-small"  flexibility="auto">
        
            <lightning:recordEditForm objectApiName="Contact">
            <lightning:inputField fieldName="LastName" />
            <lightning:inputField fieldName="FirstName" />
            <lightning:inputField fieldName="Email" />
            <lightning:inputField fieldName="Phone" />
            
             </lightning:recordEditForm>
            <div class="slds-p-horizontal_small">
                <center>
                <lightning:button label="save" variant="brand" />
                    <lightning:button label="cancel" variant="Neutral " />
                    </center>
            </div>
           
     
        </lightning:layoutItem>
         
        

    </lightning:layout>
     
    </div>
</aura:application>