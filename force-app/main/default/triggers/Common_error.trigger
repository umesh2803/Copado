trigger Common_error on Contact (after insert) {
    
    list<contact> contacts=new list<contact>();
    for(contact con:[select id from contact where id IN :trigger.new]){
        con.firstname='test';
        contacts.add(con);
       
    }
    update contacts;

}