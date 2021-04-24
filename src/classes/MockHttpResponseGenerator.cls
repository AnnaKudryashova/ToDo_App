@isTest
global with sharing class MockHttpResponseGenerator {

    global with sharing class Mock implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            if (req.getMethod() == 'POST') {
                System.assertEquals('callout:ToDoCredential/services/apexrest/ToDo', req.getEndpoint());
                // System.assertEquals('{"status":"2","priority":"High","name":"1","externalId":"7","description":"4","category":"5"}', req.getBody());
                return MockHttpResponseGenerator.testPost();
            } else if (req.getMethod() == 'PUT') {
                System.assertEquals('callout:ToDoCredential/services/apexrest/ToDo', req.getEndpoint());
                System.assertEquals('{"status":"2","priority":"High","name":"2","externalId":"7","description":"4","category":"5"}', req.getBody());
                return MockHttpResponseGenerator.testPut();
            } else if (req.getMethod() == 'DELETE') {
                // System.assertEquals('callout:ToDoCredential/services/apexrest/ToDo/1', req.getEndpoint());
                return MockHttpResponseGenerator.testDelete();
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