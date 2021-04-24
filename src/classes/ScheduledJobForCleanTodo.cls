public with sharing class ScheduledJobForCleanTodo implements Schedulable {

    public static String sch24 = '0 0 0 1/1 * ? *';

    public static String runTodoCleaner24() {
        ScheduledJobForCleanTodo sc = new ScheduledJobForCleanTodo();
        return System.schedule('Job clean Todo', sch24, sc);
    }

    public void execute(SchedulableContext sc) {
        TodoCleanerBatch inst = new TodoCleanerBatch();
        ID batchprocessid = Database.executeBatch(inst, 50);
    }
}