trigger TriggerOpportunity on Opportunity (before update,after insert) {

    List<Opportunity> opportunityList =Trigger.new;
    
    OpportunityUpdate.populateInOpportunity(opportunityList);
}