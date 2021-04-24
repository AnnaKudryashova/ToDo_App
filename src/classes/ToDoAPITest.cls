@isTest
public with sharing class ToDoAPITest {
    @isTest static void testCreateToDo() {
        ID thisToDoId = ToDoAPI.doPost(
            'name', 'status', null, 'description', 'category', 'externalId');
        System.assert(thisToDoId != null);
        ToDo__c thisToDo = [SELECT Id, Name, External_Id__c FROM ToDo__c WHERE Id=:thisToDoId];
        System.assert(thisToDo != null);
        System.assertEquals(thisToDo.Name, 'name');
        System.assertEquals(thisToDo.External_Id__c, 'externalId');
    }
    @isTest static void testDeleteToDo() {
        String externalId = createTestRecord();
        List<ToDo__c> lstToDo = [SELECT Id FROM ToDo__c WHERE External_Id__c=:externalId];
        System.assert(lstToDo.size() == 1);

        RestRequest request = new RestRequest();
        request.requestUri =
            'callout:ToDoCredential/services/apexrest/ToDo' + '/' + externalId;
        request.httpMethod = 'DELETE';
        request.addHeader('Content-Type', 'application/json');
        RestContext.request = request;
        ToDoAPI.doDelete();

        lstToDo = [SELECT Id FROM ToDo__c WHERE External_Id__c=:externalId];
        System.assert(lstToDo.size() == 0);
    }  
    @isTest static void testUpdateToDo() {
        String externalId = createTestRecord();

        ID thisToDoId = ToDoAPI.doUpdate(
            'name', 'Working', null, 'description', 'category', 'externalId');
        
        RestRequest request = new RestRequest();
        request.requestUri =
            'callout:ToDoCredential/services/apexrest/ToDo' + externalId;
        request.httpMethod = 'PATCH';
        request.addHeader('Content-Type', 'application/json');
        RestContext.request = request;

        ToDo__c thisToDo = [SELECT Id,Status__c FROM ToDo__c WHERE External_Id__c=:externalId];
        System.assert(thisToDo != null);
        System.assertEquals(thisToDo.Status__c, 'Working');
    }  

    static String createTestRecord() {
        RecursionCheck.setToDoInserted(true);
        ToDo__c toDoTest = new ToDo__c(
            Name='name',
            Status__c='New',
            Description__c='some',
            Priority__c='Medium',
            External_Id__c='externalId');
        insert toDoTest;
        return toDoTest.External_Id__c;
    }
}