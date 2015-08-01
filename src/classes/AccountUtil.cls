public with sharing class AccountUtil {

public static void createContact(List<account> accList){
	List<Account> acList = trigger.new;
	List<Contact> conList = new List<Contact>();
	for(Account ac : accList){
		//Integer i = 0;
		//for(Integer i=0 ; i<10 ; i++){
			Contact con = new Contact(LastName = 'Test '+ ac.name, accountId = ac.id);
			conList.add(con);
		//}
	}
	insert conList;
}
}