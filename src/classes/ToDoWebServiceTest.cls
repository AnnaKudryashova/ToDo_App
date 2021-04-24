@isTest
public with sharing class ToDoWebServiceTest {
    @isTest
    public static void testPostToDo() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator.Mock());

        ToDoWebService.NewToDoRequestWrapper newToDo = new ToDoWebService.NewToDoRequestWrapper();
        newToDo.name = '1';
        newToDo.status = '2';
        newToDo.priority = 'High';
        newToDo.description = '4';
        newToDo.category = '5';
        newToDo.externalId = '7';
        HttpResponse res = ToDoWebService.addToDo(newToDo);
        System.assertEquals(200, res.getStatusCode());
    }
    @isTest
    public static void testPutToDo() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator.Mock());

        ToDoWebService.NewToDoRequestWrapper newToDo = new ToDoWebService.NewToDoRequestWrapper();
        newToDo.name = '2';
        newToDo.status = '2';
        newToDo.priority = 'High';
        newToDo.description = '4';
        newToDo.category = '5';
        newToDo.externalId = '7';
        HttpResponse res = ToDoWebService.updateToDo(newToDo);
        System.assertEquals(200, res.getStatusCode());
    }
    @isTest
    public static void testDeleteToDo() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator.Mock());
        HttpResponse res = ToDoWebService.deleteToDo('1');
        System.assertEquals(200, res.getStatusCode());
    }
}