trigger StateAndTimeZone on Lead (after insert, after update) {
	
	  for(Lead ld : Trigger.new) {
        
        
        //check if the phone is not null and length is 10 
        //check if the state is null 
        //pick the first three characters of the phone no 
        //if null then query the custom object for the state and time zone
       if(Trigger.isInsert) {
       if ((ld.Phone != null) && (ld.Phone.Length() >= 10 )){
       		String strStateCode = ld.phone.SubString(0,3) ;
       		for(StateAndTimeZone__c st: [SELECT  states__c , state_code__c,time_zone__c
       									 FROM StateAndTimeZone__c
       									 WHERE state_code__C = :strStateCode])
       		{
       			if (st!= null  ){
       			ld.state = st.states__C;
       			ld.time_zone__c = st.time_zone__c;
       			}
       		}

       }
       	
       	
       	
       }
       
       // only of the phone no has changed and the state and time zone has not changed 
       if(Trigger.isUpdate) {
            if(ld.Phone != null
            && ld.Phone != Trigger.oldMap.get(ld.Id).phone) {
             String strStateCode = ld.phone.SubString(0,3) ;
       		for(StateAndTimeZone__c st: [SELECT  states__c , state_code__c,time_zone__c
       									 FROM StateAndTimeZone__c
       									 WHERE state_code__C = :strStateCode])
       		{
       			
       			if (ld.state== Trigger.oldMap.get(ld.Id).state && st != null )
       				ld.state = st.states__C; 
       			//if (ld.time_zone__c== Trigger.oldMap.get(ld.Id).time_zone__c && st)
       			ld.time_zone__c = st.time_zone__c;
       		}
            }
        }
	  }
 /*       if(Trigger.isInsert) {
            if(Id.Phone== 'Closed Won') {
                tl.add(new Task(Subject = 'Follow Up Test Task', WhatId = op.Id));
            }
        }
        
        
        //during update check if the records stage name is updated 
        if(Trigger.isUpdate) {
            if(Op.StageName == 'Closed Won' 
            && Op.StageName != Trigger.oldMap.get(op.Id).StageName) {
                tl.add(new Task(Subject = 'Follow Up Test Task', WhatId = op.Id));
            }
        }       
    }
	
   */ 
}