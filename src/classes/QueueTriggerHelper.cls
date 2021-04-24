public with sharing class QueueTriggerHelper {
    static boolean isFired = false;
    public static void assignQueue(List<ToDo__c> assignedTodos) {
        if (!isFired) {
        	List<Group> queueList = [SELECT Id, Name FROM Group WHERE Type = 'Queue'];
            Map<String, Id> queueMap = new Map<String,Id>();
            for (Group queue:queueList) {
                queueMap.put(queue.Name, queue.Id);
            }
            Id recordTypeBusinessId = Schema.SObjectType.ToDo__c.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();
            
            for (ToDo__c todo:assignedTodos) {
                if (todo.RecordTypeId == recordTypeBusinessId) {
                   todo.OwnerId = queueMap.get('Business Queue');
                } else {
                    todo.OwnerId = queueMap.get('Personal Queue');
                }               
            }
            isFired = true;
    	}
	}
}