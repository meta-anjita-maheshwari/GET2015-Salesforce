/*
 * Trigger will check before insert student if class has reached to its maximum limit.
 * If yes : then do not let student insert in class.
 */
trigger StudentBeforeInsert on Student__c (before insert) {
   
    if(Trigger.isBefore && Trigger.isInsert){
        set<Id> classIds = new Set<ID>();
        for(Student__c student : trigger.new) {
            classIds.add(student.class__c);
        }
        
        Map<Id,class__c> classMap = new Map<Id,class__c>();
        for(ID c : classIds){
            if(!classMap.containsKey(c)) {
                classMap.put(c,[SELECT No_Of_Students__c,Max_Size__c FROM class__c WHERE Id = :C ]);
            }
        }
        for(student__c stdcls : trigger.new){
            if(classMap.get(stdcls.class__c).No_Of_Students__c == classMap.get(stdcls.class__c).Max_Size__c) {
                stdcls.addError('Cannot insert Record - Class is full');
            }
        } 
    }
}