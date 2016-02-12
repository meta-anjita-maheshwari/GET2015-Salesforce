public class TestRandomContactFactory {
    public static void testContact(){
        List<Contact> cl = RandomContactFactory.generateRandomContacts(5, 'sosos');
       Test.startTest();
        Database.SaveResult result = Database.insert(cl[0],false);
        Test.stopTest();

        
             }
    }