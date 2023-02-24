trigger contactTRIGGER on Contact (after insert) {
    
    map<id,list<contact>> conmap=new  map<id,list<contact>>();
   
    for(contact con:trigger.new){
        if(!conmap.containsKey(con.AccountId)){
            conmap.put(con.AccountId, new list<contact>());
        }
		list<contact> cont=conmap.get(con.AccountId);
        cont.add(con);
        conmap.put(con.AccountId, cont);
    }
    
      //  list<account> acc=[select id,name from account where id IN :conmap.keySet()];
      //  for(account acr:acc){
        list<contact> conr=[select id,lastname,firstname from contact where accountId IN :conmap.keySet()];
        for(contact conu:conr){
           
            conu.firstname='git';
        }
   
   
         update conr;        
       
  //  } 
}