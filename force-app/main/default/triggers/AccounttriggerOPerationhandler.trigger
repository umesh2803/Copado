trigger AccounttriggerOPerationhandler on Account (after insert) {
    if(trigger.isafter && trigger.isinsert)
    {
       AccountTrgiggerHandler.afterinertHandler(trigger.new);
    }
}