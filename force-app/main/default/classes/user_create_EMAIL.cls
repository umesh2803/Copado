public class user_create_EMAIL {
    
    public void usercreate(){
        //Get Profile Id
        Profile objProfile = [SELECT Id,name FROM Profile where name ='Standard Platform User' limit 1];
        //Add User Information
        User objUser = new User();
        objUser.FirstName='JOHN';
        objUser.LastName = 'CENA';
        objUser.Alias = 'JOHNC';
        objUser.Email = '';
        objUser.Username = 'JOHN@CENA123.com';
        objUser.ProfileId = objProfile.id;
        objUser.TimeZoneSidKey = 'GMT';
        objUser.LanguageLocaleKey = 'en_US';
        objUser.EmailEncodingKey = 'UTF-8';
        objUser.LocaleSidKey = 'en_US';
        //Insert User
        List<User> usersl = new List<User>(); 
        usersl.add(objUser);
        Database.DMLOptions dlo = new Database.DMLOptions();
        dlo.EmailHeader.triggerUserEmail = true;
        list<database.SaveResult> results=database.insert(usersl,dlo);
        system.debug('results>>>'+results);}
    
}