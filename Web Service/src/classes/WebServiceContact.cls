/*
 * Name : WebServiceContact
 * Author : Anjita
 * Created Date : 15/02/2016
 * Usage : Web Service class functioning according to ........... 
 */ 
global class WebServiceContact {
	/*
	 * Passing the Query will Display the results Accordingly
	 */
    webservice static String queryForContact(String query) {
       
       // Gets the Query and Serialize the Result in the Form Of Query
       List<Contact> cntList = Database.query(query);
       String str = JSON.serialize(cntList);
       return str;
    } 
   
   /*
    *  Passing the Information will Create the Student in salesforce
	*/
    webservice static String createNewStudent(String name,String ClassId,String sex,Date dob) {
       
        // Setting the Value of the Student REcord
        Student__c std = new Student__c();
        std.Name = name;
        std.Class__c = ClassId;
        std.sex__c = sex;
        std.Date_Of_Birth__c = dob;
        insert std;
        return std.Id;
    }
}