global  class DailyOpportunityAmountAggregator implements Schedulable{
	
	global void execute (SchedulableContext ct){
		
			OpportunityAmount oppAmt = new OpportunityAmount();
			
			database.executeBatch(oppAmt);
    	}			
	    
     
}