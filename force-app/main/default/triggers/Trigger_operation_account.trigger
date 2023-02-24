trigger Trigger_operation_account on Account (after insert,after update) {
    if(trigger.isInsert && trigger.isAfter){
    ACCOUNT_trigger_handler.ACCOUNT_trigger_handlermethod(trigger.new);
    
    }
}