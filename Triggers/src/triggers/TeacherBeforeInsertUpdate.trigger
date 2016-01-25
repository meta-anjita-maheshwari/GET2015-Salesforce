/*
 * Trigger will check before insert and update if the subject list contaings hindi
 * If yes : then do not let insert or update.
 */
Trigger TeacherBeforeInsertUpdate on Contact (before insert, before update) {
    
    if(Trigger.isBefore && (Trigger.isInsert||Trigger.isUpdate)){
        for(Contact cont : Trigger.New){
            if( cont.Subjects__c.contains('Hindi')) {
                cont.addError('can not update or insert : Teacher teaches Hindi');
            }
        }
    }
}