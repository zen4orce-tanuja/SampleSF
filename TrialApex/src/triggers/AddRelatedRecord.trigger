trigger AddRelatedRecord on Account (after insert, before update) {
	
	//Create a Opportunity List
	List<Opportunity> oppList = new List<Opportunity>();
	//loop account and get all the records for which there is no record in opportunities 
	for( Account a : [Select Id , Name from Account where Id IN :Trigger.New 
					and Id NOT IN (Select AccountId from Opportunity)]){
	
			oppList.add(new Opportunity(Name=a.Name,
										StageName='Prospecting',
										AccountId=a.Id,
										CloseDate=System.today().addMonths(1)));					
	
	}
	
	if(oppList.size()> 0){
		insert(oppList);
	}
    
}