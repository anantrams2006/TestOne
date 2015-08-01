@isTest
public with sharing class Test1 {

    public Test1(){}
    
    public void test(){
        System.debug('in test');
        Account acc = new Account(name='00000000000tst5');
        
        insert acc;
        System.debug(acc.Name);
    }
    
    @isTest
    public static void testTest1() {
    System.debug('in testTest1');
        Test1 t = new Test1();
        t.test();
        //Test1.test();
        System.assertEquals(true,true);
    }
    
}