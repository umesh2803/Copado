public class FileUploadController {
   
    
    public class wrapperChildObjClass{                
        @AuraEnabled
        public Id recordId;        
        
        public wrapperChildObjClass(Id recordId){            
            this.recordId = recordId;                
        }
    }
    
    
    @AuraEnabled
    public static List<wrapperChildObjClass> childObjWrapMethod(){
      List<wrapperChildObjClass> wrapObj = new List<wrapperChildObjClass>();   
       List<FilesUpload__c> childObjList = [Select Id, Name From FilesUpload__c limit 1];         
        for(FilesUpload__c childObjWrp: childObjList){
            wrapObj.add(new wrapperChildObjClass(childObjWrp.Id));
        }     
        return wrapObj;
     }    
   }