@RestResource(urlMapping='/serviceApp/*')
global with sharing class MyRestResource {

    
    
     @HttpPatch
    global static String updateCase(
        String type) {
            
            RestRequest req = RestContext.request;
            String caseId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
            Case c=[select id, type from Case where Id=:caseId];
    c.Type=type;
    update c;
        return c.Id;
    }
    
    @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        delete account;
    }
  
    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return result;
    }
  
  @HttpPost
    global static String doPost(String subject,
        String type) {
        Case c = new Case();
        c.subject = subject;
        c.type = type;
      
       // insert c;
        return c.type;
    }
   
}