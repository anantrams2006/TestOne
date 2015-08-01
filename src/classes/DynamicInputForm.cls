public with sharing class DynamicInputForm
{
public list<account> acclist{get; set;}
public List<Schema.FieldSetMember> fieldsetname{get; set;}
    public DynamicInputForm(Apexpages.standardController ctlr)
    {
        acclist = new list<Account>();
        acclist=[select id, name, fax, owner.name from account];
        fieldsetname=sObjectType.Account.FieldSets.TESTASDA.getFields();
        //constructor code
    }
  
    //Create a page block dynamically
    
}