public class Rate_APEX_1 {
    @AuraEnabled
    public static integer calculate(integer Amount,integer Rate,integer Year){
        
        integer Interest=(amount*Rate*Year)/100;
        return Interest;
     }
}