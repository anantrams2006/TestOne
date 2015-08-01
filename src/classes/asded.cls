public with sharing class asded {

    public asded(){
    }
    
    public void clickbtnn(){
        String qry = 'Select Id, (Select Id, FirstName from Account.Contacts) from Account';
        List<sObject> lst = Database.query(qry);
        if(lst != null && lst.size()>0){
            for(sObject sob : lst){
                System.debug('sOb : ' + sob);
                System.debug('SOB.ID : ' + sob.get('Id'));
                String st = 'Contacts.Id';
                SObject[] ch= sob.getSObjects('Account.Contacts');
                if(ch != null){
                    System.debug('ch : ' + ch);
                    for (SObject childRecord : ch){ 
                        Object ChildFieldValue1 = childRecord.get('Id'); 
                        Object fname = childRecord.get('FirstName');
                        System.debug('Invoice fName: ' + fName+ 
                        '. Line Item Id: '+ ChildFieldValue1);
                    }
                    
                }
                
                //sObject so = sob.get('Contacts');

                /*if(so instanceof List<Contact>){
                    System.debug('so : ' + so);
                } */
                //System.debug('SOB.contacts.ID : ' + sob.get('Contact.Id'));
                //System.debug('SOB.fName : ' + sob.get('Contacts.FirstName'));
            }
        }
        List<string> SObjectList = new List<string>();

/*for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
   String name = objTyp.getDescribe().getName();
   // Exclude all the unwanted Sobjects e.g. History, Share etc..

 if(!name.containsignorecase('history') && !name.containsignorecase('tag')&&
    !name.containsignorecase('share') && !name.containsignorecase('feed')){      
      SobjectList.add(name);
      System.debug( 'Name : ' + name);
  }

}*/
    }
}