global class  DailyLeadProcessor implements Schedulable {
	global void execute(SchedulableContext ctx){
		
		List<Lead> ld = [Select Leadsource , status from lead where leadsource=null LIMIT 200];
		
		for (Lead lds : ld ){
			lds.leadsource ='dreamforce';
		}
		
		update ld;
	}
    
}