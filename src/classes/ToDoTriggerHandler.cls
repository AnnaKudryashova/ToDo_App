public with sharing class ToDoTriggerHandler {
    
    public static void handleBeforeInsert (List<ToDo__c> todoList) {
         QueueTriggerHelper.assignQueue(todoList);
    }
    public static void handleAfterUpdate (Set<Id> setIds) { 
        ToDoHelper.ToDoUpdate(setIds);
    }
    public static void handleAfterInsert (Set<Id> setIds) {
        ToDoHelper.ToDoInsert(setIds);
    }
    public static void handleAfterDelete (List<ToDo__c> lstToDo) {
        Set<String> setExternalId = new Set<String>();
        for (ToDo__c toDo : lstToDo) {
            setExternalId.add(toDo.External_Id__c);
        }
        ToDoHelper.ToDoDelete(setExternalId);
    }
}