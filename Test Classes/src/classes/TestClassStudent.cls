/*
* Name : TestClassStudent
* Author : Anjita
* Created Date : 06/02/2016
* Usage : provide test coverage to class ClassStudent
*/  
@isTest 
public class TestClassStudent {

    /*
     * Setup method to initial data for test
     */ 
    @testSetup static void insertClassAndStudents(){
        Contact testContact = new Contact(LastName = 'testContact');
        insert testContact;
        Class__c testClass1 = new Class__C(Name__c='1st', ClassTeacher__c = testContact.id);
        insert testClass1;
        Class__c testClass2 = new Class__C(Name__c='2nd', ClassTeacher__c = testContact.id);
        insert testClass2;
        Student__c testStudent1 = new Student__c(Last_Name__c='lastName1', Class__C = testClass1.Id);
        Student__c testStudent2 = new Student__c(Last_Name__c='lastName2', Class__C = testClass1.Id);
        insert testStudent1;
        insert testStudent2;
    }
    
    /*
     * test method for method 'getStudents()' when there are two students related to class
     */ 
    @isTest static void testGetStudents1(){
        Class__C tempClass = [SELECT Name__c, Id FROM Class__C WHERE Name__c='1st'];
        List<Student__c> actualStudentList = new List<Student__c>();
        actualStudentList = ClassStudent.getStudents(tempClass.Id);
        System.assertEquals(2, actualStudentList.size());
    }
    
    /*
     * test method for method 'getStudents()' when there are no students related to class
     */ 
    @isTest static void testGetStudents2(){
        List<Student__c> actualStudentList = new List<Student__c>();
        actualStudentList = ClassStudent.getStudents('');
        System.assertEquals(null, actualStudentList);
    }
    
    /*
     * test method for method 'workingDays()' when date1 < date2
     */ 
    @isTest static void testWorkingDays1(){
        Date date1 = Date.newInstance(2016, 1, 1);
        Date date2 = Date.newInstance(2016, 2, 1);
        Integer expectedDays = 22 ;
        Integer actualDays = ClassStudent.workingDays(date1, date2);
        System.assertEquals(expectedDays, actualDays);
    }
    
    /*
     * test method for method 'workingDays()' when date1 is null
     */ 
    @isTest static void testWorkingDays2(){
        Date date1;
        Date date2 = Date.newInstance(2016, 2, 1);
        Integer expectedDays = null ;
        Integer actualDays = ClassStudent.workingDays(date1, date2);
        System.assertEquals(expectedDays, actualDays);
    }
    
    /*
     * test method for method 'workingDays()' when date1 > date2
     */ 
    @isTest static void testWorkingDays3(){
        Date date1 = Date.newInstance(2016, 2, 1);
        Date date2 = Date.newInstance(2016, 1, 1);
        Integer expectedDays = null ;
        Integer actualDays = ClassStudent.workingDays(date1, date2);
        System.assertEquals(expectedDays, actualDays);
    }
    
    /*
     * test method for method 'getMapOfClass()' when class has two related students
     */ 
    @isTest static void testGetMapOfClass1(){
        Class__C tempClass = [SELECT Name__c FROM Class__C WHERE Name__c='1st'];
        Map<Class__c,Set<ID>> studentIdsOfClass = ClassStudent.getMapOfClass();
        Set<ID> studentSet = studentIdsOfClass.get(tempClass);
        System.assertEquals(2, studentSet.size());
    }
    
    /*
     * test method for method 'getMapOfClass()' when class has zero related students
     */ 
    @isTest static void testGetMapOfClass2(){
        Class__C tempClass = [SELECT Name__c FROM Class__C WHERE Name__c='2nd'];
        Map<Class__c,Set<ID>> studentIdsOfClass = ClassStudent.getMapOfClass();
        Set<ID> studentSet = studentIdsOfClass.get(tempClass);
        System.assertEquals(0, studentSet.size());
    }
}