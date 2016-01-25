/*
 * Trigger will check after update if the Custom_Status__c is Reset.
 * If yes : then delete all the entries related to the product. 
 */
trigger DeleteOpportunityLineItemOnReset on Opportunity (after update) {
    if (Trigger.IsAfter && Trigger.IsUpdate) {
    	Set<Id> opporutnityIdSet = new Set<Id>();
    	for (Opportunity objOpportunity:Trigger.New) {
    		if (objOpportunity.Custom_Status__c != null && objOpportunity.Custom_Status__c == 'Reset') {
    			opporutnityIdSet.Add(objOpportunity.id);
    		}
    	}
        if (opporutnityIdSet != null && opporutnityIdSet.size() > 0) {
            List<OpportunityLineItem> opportunityLineItemList = [select id from OpportunityLineItem where Opportunity.Id IN :opporutnityIdSet];
            Database.delete(opportunityLineItemList);
        }
    }
}