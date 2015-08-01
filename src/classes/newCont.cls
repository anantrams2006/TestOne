public with sharing class newCont {

    public String selectedObj{get;set;}
    public String selectedChildObj{get;set;}
    public String selectedMulti{get;set;}
    List<SelectOption> childOptions = new List<SelectOption>();
    
    public List<SelectOption> getobjName(){
    
        List<Schema.SObjectType> sobjType= Schema.getGlobalDescribe().Values();     
        List<SelectOption> options = new List<SelectOption>();

        options.add(new SelectOption('', ' Select One '));
        for(Schema.SObjectType sObjVar : sobjType){
           options.add(new SelectOption(sObjVar.getDescribe().getLabel(),sObjVar.getDescribe().getLabel()));
        }
        childOptions.add(new SelectOption('', ' Select One '));
        return options;
    }
 
    public List<SelectOption> getChildName(){
        if(selectedObj != null){
            Schema.SObjectType rslt = Schema.getGlobalDescribe().get(selectedObj);
   
            if(rslt == null)
                return null;
                
            Schema.DescribeSObjectResult R = rslt.getDescribe();
         
            List<Schema.ChildRelationship> chList = R.getChildRelationships(); 
            
            Map<String, String> tempMap = new Map<String, String>();
        
            for(Schema.ChildRelationship cR : chList) {
                if(cR.getRelationshipName() != null) {
                    tempMap.put(cR.getRelationshipName(), cR.getRelationshipName());
                }
            }
    
            childOptions = new List<SelectOption>();
            childOptions.add(new SelectOption('', ' Select One '));
            childOptions.addAll(getSortedList(tempMap));

            /*if(chList != null && chList.size() > 0){
                for(Schema.ChildRelationship cR : chList){
                    if(cR.getRelationshipName() != null)
                        childOptions.add(new SelectOption(cR.getRelationshipName(), cR.getRelationshipName()));
                }
            }*/
        }
        return childOptions;
    }
    
    public List<SelectOption> getStdFields(){
        Schema.SObjectType rslt = Schema.getGlobalDescribe().get(selectedObj);
   
        if(rslt == null)
            return null;
                
        Schema.DescribeSObjectResult R = rslt.getDescribe();
        Map<String,Schema.SObjectField> mfields = R.fields.getMap();
            
        Map<String, String> tempMap = new Map<String, String>();
        
        for(Schema.SObjectField field : mfields.values()) {
            Schema.DescribeFieldResult fieldResult = field.getDescribe();  
            if(fieldResult.isAccessible()) {
                tempMap.put(fieldResult.getLabel(), fieldResult.getName());
            }
        }
        
        /*List<String> fieldNameList = new List<String>();

        fieldNameList.addAll(tempMap.keySet());
        
        fieldNameList.sort();
        
        for(String fieldName : fieldNameList){
            fieldList.add(new SelectOption(tempMap.get(fieldName), fieldName));
        }*/
        return getSortedList(tempMap);
    }
    
    private List<SelectOption> getSortedList(Map<String, String> tempMap){
    
        List<SelectOption> fieldList = new List<SelectOption>();
        List<String> fieldNameList = new List<String>();

        fieldNameList.addAll(tempMap.keySet());
        
        fieldNameList.sort();
        
        for(String fieldName : fieldNameList){
            fieldList.add(new SelectOption(tempMap.get(fieldName), fieldName));
        }
        return fieldList;
    }
    
}