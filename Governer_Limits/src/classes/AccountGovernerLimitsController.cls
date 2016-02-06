/*
* Name : AccountGovernerLimitsController
* Author : Anjita
* Created Date : 06/02/2016
* Usage : controller class to demonstrate governor limits
* class fetches 10 records and apply dml operation on them.
* class apply upsert operation on10 account operation without any change and debugs all limits.
*/ 
public class AccountGovernerLimitsController {
    
    /* account list to fetch 10 records */
    public List<Account> accList { get; set; }
    /* to show percentage of DML consumed out of provided limit */
    public double percent { get; set; }
    /* to display records */
    public boolean display { get; set; }
    
    /*
     * Default constructor
     */ 
    public AccountGovernerLimitsController(){
        accList=new List<Account>();
        display=false;
    }
    
    /*
     * function to fetch 10 records and apply update operation 
     * also debugs governor limits
     */ 
    public void updateAccount() {
        //fetching 10 accounts from database
        accList=[Select Id,Name from Account Limit 10];
        //updating account list
        update accList;
        display=true;
        //percent of DMLs were being consumed out of provided DMLs limit.
        percent=limits.getQueries();
        System.debug('number Of Queries Executed' +limits.getQueries());
        System.debug('number of aggregate queries that have been processed with any SOQL query statement' +limits.getAggregateQueries());
        System.debug('number Of records returned by issuing SOQL queries' +limits.getQueryRows());
        System.debug('Queries Limit' +limits.getLimitQueries());
        System.debug('number of records that have been processed with any statement that counts against DML limits' +limits.getDMLRows());
        System.debug('number of DML statements that have been called' +limits.getDMLStatements());
        System.debug('approximate amount of memory (in bytes) that has been used for the heap'+limits.getHeapSize());
        System.debug('CPU time (in milliseconds) accumulated on the Salesforce servers in the current transaction'+limits.getCpuTime());
    }
    
}