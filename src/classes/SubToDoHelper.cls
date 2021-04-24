public with sharing class SubToDoHelper {
    @future (callout=true)
    public static void SubToDoUpdate(Set<Id> setIds) {
        for(Sub_ToDo__c subToDo : [SELECT Id, Name, Description__c, Is_Done__c,
                                  External_Id__c FROM Sub_ToDo__c WHERE Id IN : setIds]) {
            SubToDoWebService.NewSubToDoRequestWrapper newSubToDo = new SubToDoWebService.NewSubToDoRequestWrapper();
            newSubToDo.name = subToDo.Name;
            newSubToDo.isDone = subToDo.Is_Done__c;
            newSubToDo.description = subToDo.Description__c;
            newSubToDo.id = subToDo.Id;
            newSubToDo.externalId = subToDo.External_Id__c;
            SubToDoWebService.updateSubToDo(newSubToDo);
        }
    }

    @future (callout=true)
    public static void SubToDoInsert(Set<Id> setIds) {
        for(ToDo__c toDo : [SELECT External_Id__c, (SELECT Id, Name, Description__c, Is_Done__c,
                           External_Id__c FROM Sub_ToDos__r WHERE Id IN : setIds) FROM ToDo__c]){
            for(Sub_ToDo__c subToDo : toDo.Sub_ToDos__r) {
                SubToDoWebService.NewSubToDoRequestWrapper newSubToDo = new SubToDoWebService.NewSubToDoRequestWrapper();
                newSubToDo.name = subToDo.Name;
                newSubToDo.isDone = subToDo.Is_Done__c;
                newSubToDo.description = subToDo.Description__c;
                newSubToDo.id = subToDo.Id;
                newSubToDo.masterExternalId = toDo.External_Id__c;
                newSubToDo.externalId = subToDo.External_Id__c;
                SubToDoWebService.addSubToDo(newSubToDo);
            }
        }
    }

    @future (callout=true)
    public static void SubToDoDelete(Set<String> setExternalId) {
        if (!setExternalId.isEmpty()) {
            for(String externalId : setExternalId) {
                system.debug(externalId);
                SubToDoWebService.deleteSubToDo(externalId);
            }
        }
    }
}