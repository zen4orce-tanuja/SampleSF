global class OpportunityAmount implements Database.Batchable<sObject>{
	
	global double totalAmount = 0;
	global Database.QueryLocator start(Database.BatchableContext ctx){
		String strtStage ='Closed Won';
		String strQueryString = 'select amount from opportunity where stagename=\'closed-won\' and createddate=today';
		return Database.getQueryLocator(strQueryString);
	}
	
    global void execute(Database.BatchableContext BC, List<Opportunity> opp){
    	
    	for (Opportunity op : opp){
    		op.IsAggregated__c = true;
    		
    		totalAmount = totalAmount + op.amount;
    	}
    
    	update opp;
    }
    
    global void finish(Database.BatchableContext BC){
	//CronTrigger ct = [SELECT Id, StartTime, EndTime, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id =:job.Id];
	  String stremail = 'tanuja.vyas@zen4orce.com';
	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	mail.setToAddresses(new String[] {stremail});
	
	mail.setSenderDisplayName('Batch Processing');
	mail.setSubject('Daily Opportunity Amount Aggregator Job Complete');
	system.debug('***CronTrigger.StartTime**' + CronTrigger.StartTime);
	system.debug('***CronTrigger.EndTime**' + CronTrigger.EndTime);
	mail.setPlainTextBody('Start DateTime: ' + CronTrigger.StartTime +' End DateTime: ' + CronTrigger.EndTime +' Total Opportunity Amount for today: '+totalAmount);
	
	Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}