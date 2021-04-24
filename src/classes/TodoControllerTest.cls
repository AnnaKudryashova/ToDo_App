@isTest
private with sharing class TodoControllerTest {
    @TestSetup
    static void makeData(){
        List<ToDo__c> todoList = new List<ToDo__c>();
        for (Integer i = 0; i < 10; i++) {
            todoList.add(new ToDo__c(Name = 'TodoTest' + i));
        }
        RecursionCheck.setToDoInserted(true);
        insert todoList;
    }

    @isTest
    static void testController() {
        Test.startTest();
        List<ToDo__c> result = TodoController.getTodoList('%', '%', '');
        Test.stopTest();
        System.assertEquals(10, result.size());
    }
}