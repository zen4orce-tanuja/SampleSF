public with sharing class ContactAndLeadSearch {
	
	public static List<List<SObject>>searchContactsAndLeads(String strSearchString){
		List<List<SObject>> searchList = [FIND :strSearchString IN ALL FIELDS RETURNING Contact(firstname , lastname) ,Lead(FirstName,lastname)];
		return searchList;
	}
    
}