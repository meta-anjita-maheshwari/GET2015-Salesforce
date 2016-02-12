/*
* Name : TestClassBeforeDelete
* Author : Anjita
* Created Date : 11/02/2016
* Usage : provide test coverage to class ClassBeforeDelete
*/
@isTest
public class TestClassBeforeDelete {

    /*
     * Setup method to initial data for test
     */ 
    @testSetup static void insertClass(){
        Contact teacher = new Contact(LastName = 'teacher1');
        insert teacher;
        Class__c class1=new Class__c(Name__c='1st' , ClassTeacher__c = teacher.Id);
        insert class1;
        Student__c student1= new Student__c(Last_Name__c='Student1',Class__c=class1.Id,Sex__c='Female');
        insert student1;
        Student__c student2= new Student__c(Last_Name__c='Student2',Class__c=class1.Id,Sex__c='Female');
        insert student2;
    }
    
    @isTest static void doNotDeleteClassWithFemaleStudents(){
        Class__c class1 = [SELECT Name__c FROM Class__c WHERE Name__c='1st'];
        test.startTest();
        Database.DeleteResult result = Database.delete(class1, false);
        Test.stopTest();
        system.debug(result);
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete Class, Class have more than one female students',
                            result.getErrors()[0].getMessage());
    } 
}