@isTest
public with sharing class SubToDoWebServiceTest {
    @isTest
    public static void testPostSubToDo() {
        Test.setMock(HttpCalloutMock.class, new MockSubHttpResponseGenerator.Mock());

        SubToDoWebService.NewSubToDoRequestWrapper newSubToDo = new SubToDoWebService.NewSubToDoRequestWrapper();
        newSubToDo.name = '1';
        newSubToDo.isDone = true;
        newSubToDo.description = '3';
        newSubToDo.masterExternalId = null;
        newSubToDo.externalId = '6';
        HttpResponse res = SubToDoWebService.addSubToDo(newSubToDo);
        System.assertEquals(200, res.getStatusCode());
    }
    @isTest
    public static void testPutSubToDo() {
        Test.setMock(HttpCalloutMock.class, new MockSubHttpResponseGenerator.Mock());

        SubToDoWebService.NewSubToDoRequestWrapper newSubToDo = new SubToDoWebService.NewSubToDoRequestWrapper();
        newSubToDo.name = '1';
        newSubToDo.isDone = true;
        newSubToDo.description = '1';
        newSubToDo.masterExternalId = null;
        newSubToDo.externalId = '6';
        HttpResponse res = SubToDoWebService.updateSubToDo(newSubToDo);
        System.assertEquals(200, res.getStatusCode());
    }
    @isTest
    public static void testDeleteSubToDo() {
        Test.setMock(HttpCalloutMock.class, new MockSubHttpResponseGenerator.Mock());
        HttpResponse res = SubToDoWebService.deleteSubToDo('1');
        System.assertEquals(200, res.getStatusCode());
    }
}