trigger accountnee on Account (after insert) {
    
    for(account acc:trigger.new){
        contact con=new contact();
        con.accountId=acc.id;
        con.LastName=acc.Name;
        insert con;
    }

}