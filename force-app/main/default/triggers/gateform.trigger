trigger gateform on GATE_Student_Information__c (after insert) {
    for(GATE_Student_Information__c st:trigger.new)
    {
        student_login__c s=new student_login__c();
        s.GATE_Student_Information__c=st.id;
        s.name=st.Name;
        s.password__c=st.confirm_Password__c;
        insert s;
        
        
    }

}