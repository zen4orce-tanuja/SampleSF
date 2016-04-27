public with sharing class AccountProcessor {
    @future
    
    public static void countContacts(Set<id> accIds){
    	 List<Account> lstAccount = [select id,Number_of_Contacts__c , (select id from contacts ) from account where id in :accIds];
    
 	   for( Account acc : lstAccount )

      {

          List<Contact> lstCont = acc.contacts ;

          acc.Number_of_Contacts__c = lstCont.size();

      }
    }
}