public with sharing class TodoController {
    @AuraEnabled(cacheable=true)
    public static List<ToDo__c> getTodoList(String searchValue) {
        return [
            SELECT
                Id,
                Name,
                Description__c,
                Category__c,
                Priority__c,
                Status__c,
                Owner.Name,
                (SELECT Name, Description__c, Is_Done__c FROM Sub_ToDos__r)
            FROM ToDo__c
            WHERE Name Like :('%' + searchValue + '%')
        ];
    }
}