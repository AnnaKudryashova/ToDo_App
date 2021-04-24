trigger SubToDoTrigger on Sub_ToDo__c (
        before update,
        before insert,
        before delete,
        after insert, 
        after update, 
        after delete,
        after undelete) {
    if(Trigger.isAfter && Trigger.isUpdate) {
        SubToDoTriggerHandler.handleAfterUpdate(Trigger.oldMap.keySet());
    }
    if(Trigger.isAfter && Trigger.isDelete) {
        SubToDoTriggerHandler.handleAfterDelete(Trigger.old);
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        SubToDoTriggerHandler.handleAfterInsert(Trigger.newMap.keySet());
    }
}