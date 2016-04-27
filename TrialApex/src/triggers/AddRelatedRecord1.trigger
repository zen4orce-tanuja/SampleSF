trigger AddRelatedRecord1 on Account (after insert, after update) {

   	List<Opportunity>oppList = new List<Opportunity>();
    Map<Id, Account > accWithOps = new Map<Id,Account>
        				([Select Id, (Select Id from Opportunities)From Account 
                         where Id in :Trigger.New]);
    
        for (Account a : Trigger.new){
            if (accWithOps.get(a.Id).Opportunities.size()==0){
    			oppList.add(new Opportunity(Name = a.name + 'Opportunity',
                                            StageName= 'Prospecting',
                                            AccountId=a.id,
                                            Closedate = System.today()));
                                            
            }
            
        }
    
    if (oppList.size() >0 ){
        insert oppList;
    }
    
}