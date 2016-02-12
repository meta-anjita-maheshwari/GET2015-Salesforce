/*
* Name : TestListOfSObject
* Author : Anjita
* Created Date : 06/02/2016
* Usage : provide test coverage to class ListOfSObject
*/ 
@isTest
public class TestListOfSObject {

    @isTest static void testListobjects(){
        List<Schema.SObjectType> listOfSObj = ListOfSObject.listobjects();
        System.assertEquals(355, listOfSObj.size());
    }
}