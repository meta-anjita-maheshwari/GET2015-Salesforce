/*
 * Controller which will show 10 account records at a time according to filter result
 * Pagination is provided to see next records.
 */ 
public class SearchRecordsPagination {
    
    /* to get account size*/
    public final Account acc { get; set; }
    /* to get all accounts */
    public List<Account> accList { get; set; }
    /* total records available */
    private integer totalRecs = 0;
    /* offset indicating starting list record */
    private integer OffsetSize = 0;
    /* limit size : no of records shown at one page */
    private integer LimitSize = 10;
    /* billingCity of account */    
    public String billingCity {get;set;}
    /* billingState of account */
    public String billingState {get;set;}
    /* billingCountry of account */
    public String billingCountry{get;set;}
    
    /*
     * default constructor initializing value of total records
     */ 
    public SearchRecordsPagination() {
        acc = new Account();
        totalRecs = [select count() from account];
    }
    
    /*
     * fetching all accounts according to filter.
     */ 
    public void fetch() {
        String query = 'SELECT Name, BillingCity, BillingState, BillingCountry FROM Account WHERE ';
        
        if(!String.IsBlank(billingCity)) {
            query += 'BillingCity LIKE \'%' + billingCity + '%\' AND ';
        }
        
        if(!String.IsBlank(billingState)) {
            query += 'BillingState LIKE \'%' + billingState  + '%\' AND ';
        }
        
        if(!String.IsBlank(billingCountry)) {
            query += 'BillingCountry LIKE \'%' + billingCountry + '%\' AND ';
        }
        
        query = query.substring(0, query.length() - 4);
        query += ' LIMIT ' + LimitSize + ' OFFSET ' + OffsetSize;
        
        accList = Database.query(query);
        totalRecs = accList.size();
    }
    
    /*
     * first page content
     */ 
    public void FirstPage() {
        OffsetSize = 0;
        fetch();
    }
    
    /*
     * previous page content
     */ 
    public void previous() {
        OffsetSize = OffsetSize - LimitSize;
        fetch();
    }
    
    /*
     * next page content
     */ 
    public void next() {
        OffsetSize = OffsetSize + LimitSize;
        fetch();
    }
    
    /*
     * Last page content
     */ 
    public void LastPage() {
        OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
        fetch();
    }
    
    /*
     * returns a boolean value
     * return : true : if no more previous page is available
     */ 
    public boolean getprev() {
        if(OffsetSize == 0)
            return true;
        else
            return false;
    }
    
    /*
     * returns a boolean value
     * return : true : if no more next page is available
     */ 
    public boolean getnxt() {
        if((OffsetSize + LimitSize) > totalRecs)
            return true;
        else
            return false;
    }
}