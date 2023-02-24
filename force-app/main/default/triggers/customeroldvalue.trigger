trigger customeroldvalue on customer__c (after update) {
    
    list<test__c> test1=new list<test__c>();
    map<id,customer__c> oldmap=trigger.oldMap;
    map<id,customer__c> newmap=trigger.newmap;
    
    set<id> ids=oldMap.keyset();
        
    for(id k:ids)
    {   
        customer__c oldcust=oldmap.get(k);
        customer__c newcust=newmap.get(k);
       /* if(oldcust.Name!=newcust.Name)*/
        
          
                test__c t=new test__c();
                t.customer__c=k;
                t.Name=oldcust.name;
                t.balance__c=oldcust.balance__c;
                
                
                test1.add(t);
    } insert test1;
    
    }