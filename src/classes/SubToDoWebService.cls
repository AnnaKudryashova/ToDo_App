public with sharing class SubToDoWebService {
	public static Http http = new Http();
    public static HTTPResponse response;
    public static HttpRequest request;
 
    public class NewSubToDoRequestWrapper {
        public String name {get; set;}
        public Boolean isDone {get; set;}
        public String description {get; set;}
        public String id {get; set;}
        public String masterExternalId {get; set;}
        public String externalId {get; set;} 
    }
    private static HttpRequest prepareRequest(String method, String externalId, NewSubToDoRequestWrapper newSubToDo) {
        request = new HttpRequest();
        request.setMethod(method);
        String stringId = externalId != null ? '/' + externalId : '';
        request.setEndpoint('callout:ToDoCredential/services/apexrest/SubToDo' + stringId);
        if(newSubToDo != null) {
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            request.setBody(JSON.serialize(newSubToDo));
        }
       return request;
    }
    public static void getSubToDo(Id subToDoId) {
        request = prepareRequest('GET', subToDoId, null);
        response = http.send(request); 
        System.debug(response.getBody());
    }
    public static void addSubToDo(NewSubToDoRequestWrapper newSubToDo) {
        request = prepareRequest('POST', null, newSubToDo);
        response = http.send(request); 
        System.debug(response.getBody());
    }
    public static void updateSubToDo(NewSubToDoRequestWrapper newSubToDo) {
        request = prepareRequest('PUT', null, newSubToDo);
        response = http.send(request); 
        System.debug(response.getBody());
    }
    public static void deleteSubToDo(String externalId) {
        request = prepareRequest('DELETE', externalId, null);
        response = http.send(request); 
        System.debug(response.getBody());
    }
}