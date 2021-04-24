@isTest
public with sharing class GenerationOfUUIDTest {
    @isTest
    public static void testGenerator() {
  		Set<String> setStr = new Set<String>();
        for(Integer i = 0; i < 1000; i++) {
            String test = GenerationOfUUID.getUUID();
        	System.assertEquals(36, test.length());
            setStr.add(test);
        }
        setStr.add('a');
        setStr.add('a');
        System.assertEquals(1001, setStr.size());
    }
}