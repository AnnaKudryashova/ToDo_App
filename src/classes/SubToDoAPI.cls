@RestResource(urlMapping='/SubToDo/*')
global with sharing class SubToDoAPI {
	@HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String subToDoId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Sub_ToDo__c> subToDo = [SELECT Id FROM Sub_ToDo__c WHERE External_Id__c = :subToDoId];
        if (!subToDo.isEmpty()) {
            delete subToDo;
        }
    }
 
    @HttpPost
    global static String doPost(String name, Boolean isDone, String description, String id, String masterExternalId, String externalId) {
        ToDo__c currentMaster =  [SELECT Id FROM ToDo__c WHERE External_Id__c = : masterExternalId LIMIT 1];
        Sub_ToDo__c subToDo = new Sub_ToDo__c();
        if(currentMaster != null) {
            subToDo.Name = name;
            subToDo.Description__c = description;
            subToDo.Is_Done__c = isDone;
            subToDo.ToDo__c = currentMaster.Id;
            insert subToDo;
        }
        return subToDo.Id;
    }

    @HttpPut
    global static String doUpdate(String name, Boolean isDone, String description, String id, String masterExternalId, String externalId) {     
        Sub_ToDo__c subToDo = [SELECT Id, Name, Description__c, Is_Done__c
                                FROM Sub_ToDo__c WHERE External_Id__c = :externalId];
        if (subToDo != null) {
            subToDo.Name = name;
            subToDo.Description__c = description;
            subToDo.Is_Done__c = isDone;
            update subToDo;
        }
        return subToDo.Id;
    }
}