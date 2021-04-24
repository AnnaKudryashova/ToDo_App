@isTest
public with sharing class RecursionCheckTest {
    @isTest
    public static void testChecker() {
        System.assertEquals(false, RecursionCheck.isToDoUpdated());
        RecursionCheck.setToDoUpdated(true); 
        System.assertEquals(true, RecursionCheck.isToDoUpdated());

        System.assertEquals(false, RecursionCheck.isToDoDeleted());
        RecursionCheck.setToDoDeleted(true); 
        System.assertEquals(true, RecursionCheck.isToDoDeleted());

        System.assertEquals(false, RecursionCheck.isToDoInserted());
        RecursionCheck.setToDoInserted(true); 
        System.assertEquals(true, RecursionCheck.isToDoInserted());

        System.assertEquals(false, RecursionCheck.isSubToDoUpdated());
        RecursionCheck.setSubToDoUpdated(true); 
        System.assertEquals(true, RecursionCheck.isSubToDoUpdated());

        System.assertEquals(false, RecursionCheck.isSubToDoDeleted());
        RecursionCheck.setSubToDoDeleted(true); 
        System.assertEquals(true, RecursionCheck.isSubToDoDeleted());

        System.assertEquals(false, RecursionCheck.isSubToDoInserted());
        RecursionCheck.setSubToDoInserted(true); 
        System.assertEquals(true, RecursionCheck.isSubToDoInserted());
    }
}