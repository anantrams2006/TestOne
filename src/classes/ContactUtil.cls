public with sharing class ContactUtil {
	
	public static void updateAccount(List<Contact> conList){
		
	//	Map<Account, Integer> map = new Map<Account, Integer>();
	//	for(contact con : conList){
		/*	if(con.Account != null){ 
				if(map.containKey(con.Account))
					map.put(con.Account, map.get(con.account) +1);
				else
					map.put(con.Account, 1);
		}
		
		List<Account> lst = new List<Account>();
	
		for(Account ac : map.keySet()){
			ac.Number_of_Contact__c = map.get(ac);
			lst.add(ac);
		}
		
		update lst;
		*/
		
		
		//System.debug('in Update Account');
		//List<Account> acList = new List<Account>();
		//for(Contact con : conList){
			
			//List<Account> accList = [select id, Number_of_Contact__c, name from Account where id = :con.accountId];
			//System.debug('contact list size : '+accList.size());
		//	if(!accList.isEmpty()){
			//	Account acc = accList.get(0);
				//System.debug('Before ac.id : ' + acc.id + ' ' + acc.Name + ' ' + acc.Number_of_Contact__c);
				//acc.Number_of_Contact__c += 1;
				//System.debug('After ac.id : ' + acc.id + ' ' + acc.Name + ' ' + acc.Number_of_Contact__c);
		//		update acList;
			//	acList.add(acc);
			//}
	//	}
	//	update acList;
	}

}