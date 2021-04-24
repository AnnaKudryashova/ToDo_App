@isTest
private class QueueTriggerHelperTest {   
    @isTest
    static void testAssign() {
		List<ToDo__c> todos = Test_ToDoHelper.createToDos('test', 10);
        RecursionCheck.setToDoInserted(true); 
        insert todos; 
        Map<String, Id> queueMap = getQueueMap();
        List<ToDo__c> expectedPersonalTodos = new List<ToDo__c>();
        List<ToDo__c> expectedBusinessTodos = new List<ToDo__c>();
        for (ToDo__c todo: [SELECT Id, OwnerId FROM ToDo__c WHERE Name LIKE '%Queue %']) {
            if (todo.OwnerId == queueMap.get('Business Queue')) {
                expectedBusinessTodos.add(todo);
            } else {
                expectedPersonalTodos.add(todo);
            }
        }  
        System.assertEquals(10, expectedBusinessTodos.size());
        System.assertEquals(10, expectedPersonalTodos.size());
    }
    
    @isTest
    static Map<String, Id> getQueueMap() {     
        List<Group> queueList = [SELECT Id, Name FROM Group WHERE Type = 'Queue'];
            Map<String, Id> queueMap = new Map<String,Id>();
            for (Group queue:queueList) {
                queueMap.put(queue.Name, queue.Id);
            }
        return queueMap;
    }
}