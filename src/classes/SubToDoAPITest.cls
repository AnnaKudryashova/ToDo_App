@isTest
public with sharing class SubToDoAPITest {
    @isTest static void testCreateSubToDo() {
        Id masterId = createTestMasterRecord();
        Id thisToDoId = SubToDoAPI.doPost(
            'name', true, 'someInit', 'master', 'externalId');
        System.assert(thisToDoId != null);
        Sub_ToDo__c thisSubToDo = [SELECT Id, Name, External_Id__c, ToDo__c FROM Sub_ToDo__c WHERE Id=:thisToDoId];
        System.assert(thisSubToDo != null);
        System.assertEquals(thisSubToDo.Name, 'name');
        System.assertEquals(thisSubToDo.External_Id__c, 'externalId');
        System.assertEquals(thisSubToDo.ToDo__c, masterId);
    }
    @isTest static void testDeleteSubToDo() {
        String externalId = createTestRecord();
        List<Sub_ToDo__c> lstSubToDo = [SELECT Id FROM Sub_ToDo__c WHERE External_Id__c=:externalId];
        System.assert(lstSubToDo.size() == 1);
        
        RestRequest request = new RestRequest();
        request.requestUri =
            'callout:ToDoCredential/services/apexrest/SubToDo' + '/' + externalId;
        request.httpMethod = 'DELETE';
        request.addHeader('Content-Type', 'application/json');
        RestContext.request = request;
        SubToDoAPI.doDelete();

        lstSubToDo = [SELECT Id FROM Sub_ToDo__c WHERE External_Id__c=:externalId];
        System.assert(lstSubToDo.size() == 0);
    }  
    @isTest static void testUpdateSubToDo() {
        String externalId = createTestRecord();

        ID thisSubToDoId = SubToDoAPI.doUpdate(
            'name', true, 'test', 'master', 'externalId');
        
        RestRequest request = new RestRequest();
        request.requestUri =
            'callout:ToDoCredential/services/apexrest/SubToDo' + externalId;
        request.httpMethod = 'PATCH';
        request.addHeader('Content-Type', 'application/json');
        RestContext.request = request;

        Sub_ToDo__c thisSubToDo = [SELECT Id,Description__c FROM Sub_ToDo__c WHERE External_Id__c=:externalId];
        System.assert(thisSubToDo != null);
        System.assertEquals(thisSubToDo.Description__c, 'test');
    }  
    static String createTestRecord() {
        RecursionCheck.setSubToDoInserted(true);
        Id masterId = createTestMasterRecord();
        Sub_ToDo__c subToDoTest = new Sub_ToDo__c(
            Name='name',
            Description__c='some',
            External_Id__c='externalId',
            ToDo__c=masterId);
        insert subToDoTest;
        return subToDoTest.External_Id__c;
    }
    static Id createTestMasterRecord() {
        RecursionCheck.setToDoInserted(true);
        ToDo__c toDoTest = new ToDo__c(
            Name='name',
            Status__c='New',
            Description__c='some',
            Priority__c='Medium',
            External_Id__c='master');
        insert toDoTest;
        return toDoTest.Id;
    }
}