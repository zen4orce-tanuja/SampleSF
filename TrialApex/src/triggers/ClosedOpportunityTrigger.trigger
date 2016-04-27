trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Task> tl = new List<Task>();
    
    for(Opportunity op : Trigger.new) {
        
        
        if(Trigger.isInsert) {
            if(Op.StageName == 'Closed Won') {
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

    if(tl.size()>0) {        
        insert tl;        
    }    
}