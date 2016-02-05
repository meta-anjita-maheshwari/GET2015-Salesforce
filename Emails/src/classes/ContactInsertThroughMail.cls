/*
 * Name : ContactInsertThroughMail
 * Author : Anjita
 * Created Date : 03/02/2016
 * Usage : Class to extract contact information from xml attachment of received mail
 * This class inserts the record into contact object
 */ 
global class ContactInsertThroughMail implements Messaging.InboundEmailHandler{
    
    /*
     * Function handleInboundEmail to handle inbound emails
     * Extracts contact record from xml file and inserts into contact object.  
     */ 
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        for (Messaging.Inboundemail.TextAttachment file : email.textAttachments) {
            
            String fileBody = (String)file.body;
            
            Dom.Document doc = new Dom.Document();
            doc.load(fileBody);
            
            Dom.XMLNode contactDetails = doc.getRootElement();
            String fName = contactDetails.getChildElement('fname', null).getText();
            String lName = contactDetails.getChildElement('lname', null).getText();
            
            Contact con = new Contact();
            con.FirstName = fName;
            con.LastName = lName;
            insert con;
        }
        
        return result;
    }
}