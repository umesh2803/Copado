public class NEw_class {
   
      @future
      public static void display(string acc){
          
         account acc1=(account)JSON.deserialize(acc,account.class);
         
          contact con=new contact();
          con.lastname=acc1.name;
          con.AccountId=acc1.Id;
          insert con;
}
       
    

    

}