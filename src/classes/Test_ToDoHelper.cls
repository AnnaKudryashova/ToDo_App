@isTest
public class Test_ToDoHelper {
    public static List<ToDo__c> createToDos(String name, Integer quantity) {
        Id recordTypePersonalId = Schema.SObjectType.ToDo__c.getRecordTypeInfosByDeveloperName().get('Personal').getRecordTypeId();
        Id recordTypeBusinessId = Schema.SObjectType.ToDo__c.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();
        List<ToDo__c> listTodos = new List<ToDo__c>();
        for (Integer i=0; i<quantity; i++) {
            listTodos.add(new ToDo__c(Name='PersonalQueue ' + name + i, RecordTypeId=recordTypePersonalId));
            listTodos.add(new ToDo__c(Name='BusinessQueue ' + name + i, RecordTypeId=recordTypeBusinessId));
        }
        return listTodos;
    }
}