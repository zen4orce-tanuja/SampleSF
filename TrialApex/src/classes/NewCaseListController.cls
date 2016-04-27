public class NewCaseListController {
	
	public List<Case> getNewCases(){
		List<Case> lstCases = [SELECT ID , CaseNumber from case where status='new'];
		return lstCases;
	}
    
    
}