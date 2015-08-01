@isTest
public with sharing class ClssTest {
    
    @isTest
    public static void testthod(){
        String s1 = '1';
        String s2 = '1.1';
        String s3 = '1.2';
        String s4 = '1.2.1';
        String s5 = '1.2.1.1.1';
        String s6 = '1.2.2';
        String s7 = '1';
        
        System.debug('s1 s2 : ' + s2.compareTo(s1));
        System.debug('s2 s3 : ' + s3.compareTo(s2));
        System.debug('s3 s4 : ' + s4.compareTo(s3));
        System.debug('s4 s5 : ' + s5.compareTo(s4));
        System.debug('s5 s6 : ' + s6.compareTo(s5));
        System.debug('s6 s7 : ' + s7.compareTo(s6));
        
        Integer i = s2.compareTo(s1);
        Integer i2 = s7.compareTo(s6);
        System.debug(i<0);
        System.debug(i>0);
        System.debug(i2<0);
        System.debug(i2>0);
                
        //List<Schema.SObjectType> sobjType= Schema.getGlobalDescribe().Values();     
        //Map<String, Schema.SObjectType> maps = Schema.getGlobalDescribe();
        Map<String, String> tempMap = new Map<String, String>();
        System.debug('In method');
        /*for(Schema.SObjectType sObjVar : sobjType){
            Schema.DescribeSObjectResult des = sObjVar.getDescribe();
            if(des.isAccessible() && des.isQueryable() && des.isSearchable() && des.isCreateable() && des.isDeletable() && des.isUpdateable()){
                tempMap.put(sObjVar.getDescribe().getName(), sObjVar.getDescribe().getName());
            }
        }
        for(String st : tempMap.keySet()){
            System.debug(tempMap.get(st));
        }*/
    }
}