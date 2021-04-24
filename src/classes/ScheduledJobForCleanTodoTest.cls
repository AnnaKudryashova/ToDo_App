@isTest
private with sharing class ScheduledJobForCleanTodoTest {
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
    static void testScheduledJob() {
        String sch24 = '0 0 0 1/1 * ? *';
        Test.startTest();
        ScheduledJobForCleanTodo sc = new ScheduledJobForCleanTodo();
        String jobId = System.schedule('Job clean Todo Test', sch24, sc);
        Test.stopTest();
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
        Date nextDay = System.now().date().addDays(1);
        Time midnight = Time.newInstance(0, 0, 0, 0);
        DateTime fireTime = DateTime.newInstance(nextDay, midnight);
        System.assertEquals(sch24, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered); 
        System.assertEquals(fireTime, ct.NextFireTime);  
    }
}