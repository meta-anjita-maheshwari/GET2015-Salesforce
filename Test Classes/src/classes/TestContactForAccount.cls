/*
* Name : TestContactForAccount
* Author : Anjita
* Created Date : 06/02/2016
* Usage : provide test coverage to class ContactForAccount
*/ 
@isTest
public class TestContactForAccount {

    /*
     * Setup method to initial data for test
     */ 
    @testSetup static void insertContacts(){
        Account tempAccount = new Account(Name = 'tempAccount');
        insert tempAccount;
        Contact tempcontact1 = new Contact(LastName = 'tempcontact1', AccountId=tempAccount.Id);
        Contact tempcontact2 = new Contact(LastName = 'tempcontact2', AccountId=tempAccount.Id);
        Contact tempcontact3 = new Contact(LastName = 'tempcontact3');
        insert tempcontact1;
        insert tempcontact2;
        insert tempcontact3;
    }
    
    /*
     * test method for method 'checkContactInAccount()' 
     */
    @isTest public static void testCheckContactInAccount(){
        Contact testContact1 = [SELECT id FROM Contact WHERE LastName='tempcontact1'];
        Contact testContact2 = [SELECT id FROM Contact WHERE LastName='tempcontact2'];
        ContactForAccount.CheckContactInAccount(testContact1.Id);
        Account testAccount = [SELECT id, ContactIDs__c FROM Account WHERE Name='tempAccount'];
        String expectedIds = testContact1.Id + ',' + testContact2.Id;
        String actualIds = testAccount.ContactIDs__c;
        System.assertEquals(expectedIds, actualIds);
        
        Test.startTest();
        Contact tempcontact4 = new Contact(LastName = 'tempcontact4', AccountId=testAccount.Id);
        insert tempcontact4;
        Test.stopTest();
        Contact testContact4 = [SELECT id FROM Contact WHERE LastName='tempcontact4'];
        ContactForAccount.CheckContactInAccount(testContact4.Id);
        testAccount = [SELECT id, ContactIDs__c FROM Account WHERE Name='tempAccount'];
        expectedIds = testContact1.Id + ',' + testContact2.Id + ',' + testContact4.Id;
        actualIds = testAccount.ContactIDs__c;
        System.assertEquals(expectedIds, actualIds);
        
    }
}