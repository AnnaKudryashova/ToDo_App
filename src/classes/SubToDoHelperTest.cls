@isTest
public with sharing class SubToDoHelperTest {
    @isTest
    public static void testSubToDoUpdate() {
        ToDo__c toDo = new ToDo__c(Name = '1');
        RecursionCheck.setToDoInserted(true);
        insert toDo;
        Sub_ToDo__c subToDo = new Sub_ToDo__c(Name = '1', Is_Done__c = true, Description__c = '1',
            ToDo__c = toDo.Id, External_Id__c = '6');
        RecursionCheck.setSubToDoInserted(true); 
        insert subToDo;
        Set<Id> ids = new Set<Id>();
        ids.add(subToDo.Id);
        Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockSubHttpResponseGenerator.Mock());
            SubToDoHelper.SubToDoUpdate(ids);
        Test.stopTest();
    }
    @isTest
    public static void testSubToDoInsert() {
        ToDo__c toDo = new ToDo__c(Name = '1');
        RecursionCheck.setToDoInserted(true);
        insert toDo;
        Sub_ToDo__c subToDo = new Sub_ToDo__c(Name = '1', Is_Done__c = true, Description__c = '1',
            ToDo__c = toDo.Id, External_Id__c = '6');
        RecursionCheck.setSubToDoInserted(true); 
        insert subToDo;
        Set<Id> ids = new Set<Id>();
        ids.add(subToDo.Id);
        Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockSubHttpResponseGenerator.Mock());
            SubToDoHelper.SubToDoInsert(ids);
        Test.stopTest();
    }
    @isTest
    public static void testSubToDoDelete() {
        ToDo__c toDo = new ToDo__c(Name = '1');
        RecursionCheck.setToDoInserted(true);
        insert toDo;
        Sub_ToDo__c subToDo = new Sub_ToDo__c(Name = '1', Is_Done__c = true, Description__c = '1',
            ToDo__c = toDo.Id, External_Id__c = '1');
        RecursionCheck.setSubToDoInserted(true); 
        insert subToDo;

        Set<String> ids = new Set<String>();
        ids.add(subToDo.External_Id__c);
       
        Test.startTest();
            Test.setMock(HttpCalloutMock.class, new MockSubHttpResponseGenerator.Mock());
            SubToDoHelper.SubToDoDelete(ids);
        Test.stopTest();

    }
}