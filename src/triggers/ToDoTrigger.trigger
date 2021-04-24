trigger ToDoTrigger on ToDo__c (
        before update,
        before insert,
        before delete,
        after insert, 
        after update, 
        after delete,
        after undelete) {
     
    if(Trigger.isBefore && Trigger.isInsert) {
                ToDoTriggerHandler.handleBeforeInsert(Trigger.new);
    }
            
    if(Trigger.isAfter && Trigger.isUpdate) {
        ToDoTriggerHandler.handleAfterUpdate(Trigger.oldMap.keySet());
    }
    if(Trigger.isAfter && Trigger.isDelete) {
        ToDoTriggerHandler.handleAfterDelete(Trigger.old);
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        ToDoTriggerHandler.handleAfterInsert(Trigger.newMap.keySet());
    }
}