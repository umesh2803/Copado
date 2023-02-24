trigger accounttrigger on Account (before insert) {
    
    list<account> acc=trigger.new;
    for(account a:acc)
    {
      if(a.industry=='banking')
      {
          a.rating='hot';
          a.Ownership='public';
          
      }else{
          a.Rating='cold';
          a.Ownership='private';
      }
    }
    
    system.debug('account'+acc);

}