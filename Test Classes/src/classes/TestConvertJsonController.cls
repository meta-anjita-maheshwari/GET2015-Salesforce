/*
* Name : TestConvertJsonController
* Author : Anjita
* Created Date : 12/02/2016
* Usage : provide test coverage to class ConvertJsonController
*/
@isTest
public class TestConvertJsonController {
    
    /*
     * Setup method to initial data for test
     */ 
    @testSetup static void addAccount(){
        Account testAccount= new Account(Name='test');
        insert testAccount;
    }
    
    @isTest static void testCheckContactInAccount1() {
        List<Account> acct = [Select Id,Name From Account LIMIT 5];
        String jsonText = JSON.serializePretty(acct);
        ConvertJsonController.parseJson();
        System.debug(ConvertJsonController.text1);
        System.assertEquals(jsonText, ConvertJsonController.text1);
    }
}