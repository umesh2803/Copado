public class Account_object {
    
    @future
    public static void main()
    {
        
PermissionSetAssignment PA=[SELECT PermissionSetId, AssigneeId
FROM PermissionSetAssignment
WHERE PermissionSet.Name = 'Multifaactor_authentication'];

delete PA;
    
        
        
        
        
    }
    
}