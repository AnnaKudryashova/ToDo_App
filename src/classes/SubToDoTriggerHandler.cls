public with sharing class SubToDoTriggerHandler {
    public static void handleAfterUpdate (Set<Id> setIds) {
        SubToDoHelper.SubToDoUpdate(setIds);
    }
    public static void handleAfterInsert (Set<Id> setIds) {
        SubToDoHelper.SubToDoInsert(setIds);
    }
    public static void handleAfterDelete (List<Sub_ToDo__c> lstSubToDo) {
        Set<String> setExternalId = new Set<String>();
        for (Sub_ToDo__c subToDo : lstSubToDo) {
            setExternalId.add(subToDo.External_Id__c);
        }
        SubToDoHelper.SubToDoDelete(setExternalId);
    }
}