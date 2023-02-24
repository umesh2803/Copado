public class Batch_class_test implements database.batchable<sobject> {
    public static void main(){
        
        
    }
    public database.QueryLocator start(database.BatchableContext bt){
        string query='';
        return database.getquerylocator(query);
    }
    
    public void execute(database.batchablecontext bt,list<sobject> st){
                
        
        
    }
    public void finish(database.BatchableContext bt){
        
        system.enqueueJob(new queueable_test());
    }

}