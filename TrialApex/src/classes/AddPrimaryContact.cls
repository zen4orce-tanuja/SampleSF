public class AddPrimaryContact implements Queueable{
	
	// member variables
	private Contact m_objContact;
	private String m_strState; 
	
    public AddPrimaryContact(Contact c , String state){
    	this.m_objContact = c ; 
    	this.m_strState = state ;
    }
    
    public void execute(QueueableContext context ){
    	
    	List<Account> lstAccount = [select id , name , 
    			(select id , firstname , lastname from contacts )
    			from account where billingstate=:m_strState Limit 200];
    	List<Contact>lstContact = new List<Contact>();
    	for (Account acct:lstAccount)
    	{
    		Contact con = m_objContact.clone(false,false,false,false);	
    		con.AccountId = acct.id;
    		lstContact.add(con);
    		
    	}
    	
    	if(lstContact.size()>0){
    		insert lstContact;
    	}
    }
    	
    
}