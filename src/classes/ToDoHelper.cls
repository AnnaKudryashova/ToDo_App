public with sharing class ToDoHelper {  
    @future (callout=true)
    public static void ToDoUpdate(Set<Id> setIds) {
        for(ToDo__c toDo : [SELECT Id, Name, Status__c, Priority__c, Description__c, Category__c,
                           External_Id__c FROM ToDo__c WHERE Id IN : setIds]) {
            ToDoWebService.NewToDoRequestWrapper newToDo = new ToDoWebService.NewToDoRequestWrapper();
            newToDo.name = toDo.Name;
            newToDo.status = toDo.Status__c;
            newToDo.priority = toDo.Priority__c;
            newToDo.description = toDo.Description__c;
            newToDo.category = toDo.Category__c;
            newToDo.id = toDo.Id;
            newToDo.externalId = toDo.External_Id__c;
            ToDoWebService.updateToDo(newToDo);
        }
    }

    @future (callout=true)
    public static void ToDoInsert(Set<Id> setIds) {
        for(ToDo__c toDo : [SELECT Id, Name, Status__c, Priority__c, Description__c, Category__c,
                           External_Id__c FROM ToDo__c WHERE Id IN : setIds]) {
            ToDoWebService.NewToDoRequestWrapper newToDo = new ToDoWebService.NewToDoRequestWrapper();
            newToDo.name = toDo.Name;
            newToDo.status = toDo.Status__c;
            newToDo.priority = toDo.Priority__c;
            newToDo.description = toDo.Description__c;
            newToDo.category = toDo.Category__c;
            newToDo.id = toDo.Id;
            newToDo.externalId = toDo.External_Id__c;
            ToDoWebService.addToDo(newToDo);
        }  
    }

    @future (callout=true)
    public static void ToDoDelete(Set<String> setExternalId) {
        if (!setExternalId.isEmpty()) {
            for(String externalId : setExternalId) {
                system.debug(externalId);
                ToDoWebService.deleteToDo(externalId);
            }
        }
    }
}