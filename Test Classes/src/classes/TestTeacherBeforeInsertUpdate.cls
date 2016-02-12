/*
* Name : TestTeacherBeforeInsertUpdate
* Author : Anjita
* Created Date : 11/02/2016
* Usage : provide test coverage to class TeacherBeforeInsertUpdate
*/
@isTest
public class TestTeacherBeforeInsertUpdate {

    @isTest static void doNotAddHindiTeacher (){
        Contact teacher = new Contact(LastName='Teacher',Subjects__c='Hindi');
        Test.startTest();
        Database.SaveResult result=Database.insert(teacher, false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Error while inserting/updateing record. Con not insert/update. Teacher has subject hindi.',
                            result.getErrors()[0].getMessage());
    }    
}