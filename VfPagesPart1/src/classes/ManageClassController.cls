public with sharing class ManageClassController {
    
    /* To Display the Records */
    public Class__c recordsToDisplay { get; private set; }
    /* To save the Records */
    public Class__c saveRecords { get; private set; }
    /* To Update the Record */
    public String idToUpdate {get;set;}
    /* To display the Popup */
    public boolean displayPopup {get; set;} 
    /* Query to get the Details */
    String query = 'SELECT Id, Name__c, fee__c, board__c FROM Class__c ';
    
    /* Default Constructor */
    public ManageClassController(ApexPages.StandardController controller) {
    }
    
    /*
     * Save the details to the ajex result block
     * Makes the display pop-up hide
     */
    public void saveDetails() {  
        displayPopup = false;
        update saveRecords;  
    }  
    
    /*
     * Delete the details from the ajex result block
     */
    public void deleteDetails() { 
        saveRecords = [SELECT 
                       id,name__c,fee__C 
                       FROM
                       Class__c 
                       WHERE id = :idToUpdate];
        delete saveRecords;
    }  
    
    /*
     * Shows the class detail in the to edit block
     * For this, makes the display pop-up true
     */
    public void ShowDataToEdit() { 
        saveRecords = [SELECT
                       id, name__c, fee__c,board__C 
                       FROM Class__c 
                       WHERE id = :idToUpdate];
        displayPopup = true;    
    }  
    
    /*
     * Gets all the classes from the database to display in ajex result block.
     */ 
    public List<Class__C> getRecords() 
    {
        return Database.query(query);
    }  
}