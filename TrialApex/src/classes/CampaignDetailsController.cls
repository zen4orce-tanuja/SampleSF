public class CampaignDetailsController {
	String s = 'Recently Modified';
	
	//public Campaign_Management__c campaignObj;
	public String getViewString() {
        return s;
    }
    public void setViewString(String s) {
        this.s = s;
    }
    public List<Campaign_Management__c> campaignList {
        get {
            if (campaignList == null) {
                ManageCampaignList();
            }
            return campaignList;
        }
        set;
    }
	public PageReference myActionInController()
    {
    	ManageCampaignList();
        return null;
    }
	public void ManageCampaignList(){
		if(s== 'Recently Modified'){
    		campaignList = [SELECT Campaign_Name__c,Status__c,Type__c,Start_Date__c FROM Campaign_Management__c ORDER BY LastModifiedDate desc LIMIT 1];
    	}
    	else if(s == 'All Campaigns'){
    		campaignList = [SELECT Campaign_Name__c,Status__c,Type__c,Start_Date__c FROM Campaign_Management__c ORDER BY Start_Date__c desc LIMIT 2];
    	}
    	else if(s == 'All Active Campaigns'){
    		campaignList = [SELECT Campaign_Name__c,Status__c,Type__c,Start_Date__c FROM Campaign_Management__c ORDER BY Start_Date__c desc LIMIT 3];
    	}
    	else if(s == 'My Active Campaigns'){
    		campaignList = [SELECT Campaign_Name__c,Status__c,Type__c,Start_Date__c FROM Campaign_Management__c ORDER BY Start_Date__c desc LIMIT 4];
    	}
    	else if(s == 'Inactive Campaigns'){
    		campaignList = [SELECT Campaign_Name__c,Status__c,Type__c,Start_Date__c FROM Campaign_Management__c ORDER BY Start_Date__c desc LIMIT 5];
    	}
	}
}