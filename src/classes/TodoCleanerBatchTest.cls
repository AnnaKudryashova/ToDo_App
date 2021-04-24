@isTest
private with sharing class TodoCleanerBatchTest {
    @TestSetup
    static void makeData(){
        List<ToDo__c> todoList = new List<ToDo__c>();
        for (Integer i = 0; i < 10; i++) {
            todoList.add(new ToDo__c(Name = 'TodoTest' + i, Status__c = 'Done'));
        }
        RecursionCheck.setToDoInserted(true);
        insert todoList;
        DateTime fourMonthAgo = System.now().addMonths(-4);
        for (ToDo__c todo : [SELECT Id FROM ToDo__c]) {
            Test.setCreatedDate(todo.Id, fourMonthAgo);
        }
    }

    @isTest
    static void testCleaner() {
        Test.startTest();
        TodoCleanerBatch inst = new TodoCleanerBatch();
        ID batchprocessid = Database.executeBatch(inst, 50);
        Test.stopTest();
        System.assertEquals(
          0,
          [SELECT COUNT() FROM ToDo__c]
        );
    }
}