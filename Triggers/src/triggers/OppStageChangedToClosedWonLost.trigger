/*
 * Trigger will check before update if the opportunity Stage Name is 'Closed Won' or 'Closed Lost'
 * If yes : populates the Close Date field with Today(). 
 */
trigger OppStageChangedToClosedWonLost on Opportunity (before update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        For(Opportunity opportunity : Trigger.New){
            if(opportunity.StageName == 'Closed Won' || opportunity.StageName == 'Closed Lost'){
                opportunity.CloseDate = Date.today();
            }
        }
    }
}