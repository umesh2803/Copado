public class dynamicstudent {
    
    
    public void main()
    { String branch = 'cse';
        
    List<college__c> sobjList = Database.query('SELECT Id FROM college__c WHERE branch__c = :branch');
        
        
        
    }
    
    

}