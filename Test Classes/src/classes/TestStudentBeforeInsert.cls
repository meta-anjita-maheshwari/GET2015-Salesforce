/*
* Name : TestStudentBeforeInsert
* Author : Anjita
* Created Date : 11/02/2016
* Usage : provide test coverage to class StudentBeforeInsert
*/
@isTest
public class TestStudentBeforeInsert {

    /*
     * Setup method to initial data for test
     */ 
    @testSetup static void insertClass(){
        Contact teacher = new Contact(LastName = 'teacher1');
        insert teacher;
        Class__c class1=new Class__c(Name__c='Fourth',Max_Size__c=0,My_Count__c=0, ClassTeacher__c=teacher.id);
        insert class1;
    }
    
    @isTest static void donotAddStudentMoreThanMaxSize(){
        Class__c class1 = [SELECT Max_Size__c, No_Of_Students__c, My_Count__c FROM Class__c WHERE Name__c='Fourth'];
        System.debug(class1.No_Of_Students__c);
        Student__c student1= new Student__c(Last_Name__c='Stud',Class__c=class1.Id);
        Test.startTest();
        Database.SaveResult result=Database.insert(student1, false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Can not insert student, Class has reached its maximum limit',
                            result.getErrors()[0].getMessage());
    }
}