/*
 * controller which will set value of BillToContact__c from available contacts related to manager.
 */
public class OpportunityPageController {

    /* To get opportunity */
    public Opportunity opportunity{get;set;}
    /* Contact id which is selected to set as BillToContact__c */
    public Id contactId{get;set;}
    /* List of all contacts related to manager */
    public List<Contact> contactList{get;set;}

    /*
	 * constructor initializes the member variable by using the getRecord method from the standard controller.
	 */
    public OpportunityPageController(ApexPages.StandardController stdController) {
        this.opportunity = (Opportunity)stdController.getRecord();
        Opportunity opportunityObject=this.opportunity;
        this.contactList=[SELECT ID,Name FROM Contact where Contact.AccountID=:opportunityObject.Manager__c];
    }
    
    /*
     * Function returns all the selectOption which is contact list related to manager
     * return : List<SelectOption> : list of contacts
     */
    public List<SelectOption> getItems(){
        List<SelectOption> options=new List<SelectOption>();
        for(Contact contact:contactList)
        options.add(new SelectOption(contact.Id,contact.Name));
        return options;
    }
    
    /*
     * function sets selected contact by radio button as BillToContact__c
     */ 
	public void setManager1(){
       Opportunity opportunityObject = this.opportunity;
       opportunityObject.BillToContact__c = this.contactId;
       update opportunityObject;
    }
    
    /*
     * function clears BillToContact__c field if any value is present there.
     */ 
     public void clearManager(){
       Opportunity opportunityObject = this.opportunity;
       opportunityObject.BillToContact__c = null;
       update opportunityObject;
    }
    
}