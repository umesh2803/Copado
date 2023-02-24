trigger incomecustomer on customer__c (before insert,before delete) {
    list<test__c> tests=new list<test__c>();
    if(trigger.isbefore)
    {
        if(trigger.isinsert)
    {
        for(customer__c c:trigger.new)
    {
            if(c.salary__c>1000000&&c.salary__c<1500000)
            {
                c.income_tax__c=5*c.salary__c/100;
                
            }else{
                c.income_tax__c=10*c.salary__c/100;
            }
    } 
    }
    
        else if(trigger.isdelete)
        {
            for(customer__c c1:trigger.old)
            {
                test__c t1=new test__c();
                t1.customer__c=c1.Id;
               
                t1.Name=c1.Name;
                t1.joining_date__c=c1.joining_date__c;
                tests.add(t1);
                
            }insert tests;
        


        
        }
        
    }  
}