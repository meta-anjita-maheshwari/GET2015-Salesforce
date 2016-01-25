/*
 * Trigger will update field value My_Count__c before insert and after delete
 * trigger will increase My_Count__c by one whenever a student is inserted in class.
 */
trigger UpdateMyCount on Student__c (before insert,after delete) {

    if(Trigger.isBefore && Trigger.isInsert){
        for(Student__c student : Trigger.New){
            String class1Id = student.Class__c;
            Class__c class1 = [Select id, name, my_Count__C,No_of_Students__C from Class__c where id=:class1Id];
            class1.My_Count__c = class1.No_Of_Students__c+1;
            update class1;
        }
    }
    if(Trigger.isAfter && Trigger.isDelete){
        for(Student__c student : Trigger.OLD){
            String class1Id = student.Class__c;
            Class__c class1 = [Select id, name, my_Count__C,No_of_Students__C from Class__c where id=:class1Id];
            class1.My_Count__c = class1.No_Of_Students__c-1;
            update class1;
        }
    }
}