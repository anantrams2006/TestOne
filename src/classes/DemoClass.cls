public with sharing class DemoClass {

    public List<Account> lstAcc {get; set;}

    public DemoClass(ApexPages.StandardController controller) {
        //acc = new Account();
        lstAcc = new List<Account>([select id, name, parentId, parent.Name, checkTest__c from Account limit 10]);// order by id desc]);
        System.debug('lstAcc size : ' + lstAcc.size());
        //acc = [select id, name, parentId, parent.Name from Account where id = :ApexPages.currentPage().getParameters().get('id')];
    }
    
    public PageReference saveDemo(){
      //  save();
        return null;
    }
    
    public PageReference goNext(){
        PageReference pr = new PageReference('/apex/abc');
        return pr;
    }

}