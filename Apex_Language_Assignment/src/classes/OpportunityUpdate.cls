public class OpportunityUpdate {
	 public static void populateInOpportunity(List<Opportunity> oppList) {
     
        for(Opportunity opportunity:oppList){
                if(opportunity.BillToContact__c != null && opportunity.Manager__c == null)
                {
                    opportunity.Manager__c =opportunity.AccountId;
                }
            
        }
     
    }
}