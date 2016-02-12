/*
* Name : TestOpportunityUpdate
* Author : Anjita
* Created Date : 06/02/2016
* Usage : provide test coverage to class OpportunityUpdate
*/
@isTest
private class TestOpportunityUpdate {
    
    /*
     * Setup method to initial data for test
     */
    @testSetup static void InsertOpportunity() {
        Date  day= date.newInstance(1990, 11, 21);
        Account testAccount = new Account(Name='Test Account');
        insert testAccount;
        Contact testContact = new Contact(FirstName='Test Contact',LastName='Contact Last Name');
        insert testContact;
        Opportunity testOpp = new Opportunity(Name='Test Opportunity',AccountId=testAccount.Id,StageName='Opp Stage',CloseDate=day);
        insert testOpp;
    }
    
    /*
     * test method for method 'populateInOpportunity()' 
     */
    @isTest static void testPopulateInOpportunity() {
        Opportunity newTestOpp = [Select Manager__c,AccountId from Opportunity where Name='Test Opportunity'];
        Contact newTestcontact = [Select Id from Contact where FirstName='Test Contact'];
        Test.startTest();
        newTestOpp.BillToContact__c = newTestcontact.Id;
        Database.SaveResult result = database.update(newTestOpp,false);
        newTestOpp = [Select Manager__c,AccountId from Opportunity where Name='Test Opportunity'];
        System.assertEquals(newTestOpp.AccountId,newTestOpp.Manager__c);
        Test.stopTest();
    }    
}