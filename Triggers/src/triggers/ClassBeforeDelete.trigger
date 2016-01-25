/*
 * Trigger will check before delete if the class has more than one female students
 * If yes : do not let delete that class 
 */
trigger ClassBeforeDelete on Class__c (before delete) {
	
    if(Trigger.isBefore && Trigger.isDelete){
        set<ID> classSet = new Set<ID>();
        System.debug('TRiggernew   ' +Trigger.OLD);
                for(Class__c class1 : Trigger.OLD) {
                    System.debug('in for loop ' + class1.id);
                     classSet.add(class1.id);
                }
        
        List<Student__c> studentList;
        for(ID cid : classSet){
            studentList = new List<Student__c>();
            studentList = [SELECT Name, Age__c, Sex__c FROM Student__c WHERE Sex__c = 'Female' AND Class__r.id = :cid];
            System.debug(studentList.size());
            for(Student__c student : studentList){
                Class__c class1 = student.Class__r;
                class1.addError('can not delete class : More than one female students');
            }
        }
    }
}