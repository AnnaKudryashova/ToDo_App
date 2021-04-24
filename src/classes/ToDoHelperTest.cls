@isTest
public with sharing class ToDoHelperTest {
    @isTest
    public static void testToDoUpdate() {
        ToDo__c toDo = new ToDo__c(Name = '2', Status__c = '2', Priority__c = 'High',
            Description__c = '4', Category__c = '5', External_Id__c = '7');
        RecursionCheck.setToDoInserted(true);
        insert toDo;
        Set<Id> ids = new Set<Id>();
        ids.add(toDo.Id);
        Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator.Mock());
            ToDoHelper.ToDoUpdate(ids);
        Test.stopTest();
    }
    @isTest
    public static void testToDoInsert() {
        ToDo__c toDo = new ToDo__c(Name = '1', Status__c = '2', Priority__c = 'High',
        Description__c = '4', Category__c = '5', External_Id__c = '7');
        RecursionCheck.setToDoInserted(true);
        insert toDo;
        Set<Id> ids = new Set<Id>();
        ids.add(toDo.Id);
        Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator.Mock());
            ToDoHelper.ToDoInsert(ids);
        Test.stopTest();
    }
    @isTest
    public static void testToDoDelete() {
        ToDo__c toDo = new ToDo__c(Name = '2', Status__c = '2', Priority__c = 'High',
            Description__c = '4', Category__c = '5', External_Id__c = '1');
        RecursionCheck.setToDoInserted(true);
        insert toDo;

        Set<String> ids = new Set<String>();
        ids.add(toDo.External_Id__c);
       
        Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator.Mock());
            ToDoHelper.ToDoDelete(ids);
        Test.stopTest();

    }
}