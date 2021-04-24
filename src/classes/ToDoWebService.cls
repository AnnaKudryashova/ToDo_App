public with sharing class ToDoWebService {
	public static Http http = new Http();
    public static HTTPResponse response;
    public static HttpRequest request;
 
    public class NewToDoRequestWrapper {
        public String name {get; set;}
        public String status {get; set;}
        public String priority {get; set;}
        public String description {get; set;}
        public String category {get; set;}
        public String id {get; set;}
        public String externalId {get; set;}
    }
    private static HttpRequest prepareRequest(String method, String externalId, NewToDoRequestWrapper newToDo) {
        request = new HttpRequest();
        request.setMethod(method);
        String stringId = externalId != null ? '/' + externalId : '';
        request.setEndpoint('callout:ToDoCredential/services/apexrest/ToDo' + stringId);
        if(newToDo != null) {
            system.debug(newToDo);
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            request.setBody(JSON.serialize(newToDo));
        }
       return request;
    }
    public static void addToDo(NewToDoRequestWrapper newToDo) {
        request = prepareRequest('POST', null, newToDo);
        response = http.send(request); 
        System.debug(response.getBody());
    }
    public static void updateToDo(NewToDoRequestWrapper newToDo) {
        request = prepareRequest('PUT', null, newToDo);
        response = http.send(request); 
        System.debug(response.getBody());
    }
    public static void deleteToDo(String externalId) {
        request = prepareRequest('DELETE', externalId, null);
        response = http.send(request); 
        System.debug(response.getBody());
    }
}