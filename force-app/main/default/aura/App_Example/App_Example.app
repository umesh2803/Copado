<aura:application extends="force:slds">
 <div class="slds-card">
    <lightning:layout multipleRows="true">
        <lightning:layoutItem size="12" padding="around-small">
             <span class="slds-avatar slds-avatar_profile-image-large">
             <span class="slds-assistive-text">Person name</span>
             </span>     
            <c:Acc_Name_child1 />
         
        </lightning:layoutItem>
        <div class="slds-card slds-p-around_small"><lightning:dynamicIcon type="waffle" alternativeText="Application launcher"/></div>
        <div class="slds-card slds-p-left_small"><b>Basic Information</b></div>
       
        <lightning:layoutItem size="12" padding="around-small">
          <div class="slds-box"><c:Acc_Name_child2 />
              </div> 
        </lightning:layoutItem>
         
       </lightning:layout>
       	</div>
 
    
<lightning:listView aura:id="listView"
    objectApiName="Insurance_Policy__c"
    listName="All"
    rows="5"
    showSearchBar="true"
    showActionBar="false"
    enableInlineEdit="true"
    showRowLevelActions="false"
/>
  
  <!--SELECT DeveloperName, SObjectType FROM ListView -->
    
</aura:application>