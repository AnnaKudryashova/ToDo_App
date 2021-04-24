public with sharing class TodoCleanerBatch implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        Decimal maxAge = [SELECT DeveloperName, Max_Age_Month__c from Todo_Clean__mdt WHERE DeveloperName = 'Default_3_month'].Max_Age_Month__c;
        Integer subtractAge = - Integer.valueOf(maxAge);
        DateTime finalDate = datetime.now().addMonths(subtractAge);
        return Database.getQueryLocator(
            'SELECT CreatedDate, Status__c ' +
            'FROM ToDo__c ' +
            'WHERE CreatedDate < :finalDate ' +
            'AND Status__c = \'Done\''
        );
    }

    public void execute(Database.BatchableContext bc, List<ToDo__c> scope) {
        RecursionCheck.setToDoDeleted(true);
        delete scope;
    }

    public void finish(Database.BatchableContext bc) {
    }
}