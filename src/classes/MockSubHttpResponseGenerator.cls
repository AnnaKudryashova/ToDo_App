@isTest
global with sharing class MockSubHttpResponseGenerator {
    global with sharing class Mock implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            if (req.getMethod() == 'POST') {
                System.assertEquals('callout:ToDoCredential/services/apexrest/SubToDo', req.getEndpoint());
                System.assertEquals('{"name":"1","masterExternalId":null,"isDone":true,"externalId":"6","description":"3"}', req.getBody());
                return MockSubHttpResponseGenerator.testPost();
            } else if (req.getMethod() == 'PUT') {
                System.assertEquals('callout:ToDoCredential/services/apexrest/SubToDo', req.getEndpoint());
                System.assertEquals('{"name":"1","masterExternalId":null,"isDone":true,"externalId":"6","description":"1"}', req.getBody());
                return MockSubHttpResponseGenerator.testPut();
            } else if (req.getMethod() == 'DELETE') {
                System.assertEquals('callout:ToDoCredential/services/apexrest/SubToDo/1', req.getEndpoint());
                return MockSubHttpResponseGenerator.testDelete();
            } else {
                System.assert(false, 'unexpected endpoint ' + req.getEndpoint());
                return null;
            }
        }
    }

    @isTest
    global static HTTPResponse testPost() {
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        return res;
    }
    @isTest
    global static HTTPResponse testPut() {
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        return res;
    }
    @isTest
    global static HTTPResponse testDelete() {
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        return res;
    }
}