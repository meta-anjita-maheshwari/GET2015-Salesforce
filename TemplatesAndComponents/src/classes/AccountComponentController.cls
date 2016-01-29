/*
 * Controller which will show 10 account records at a time with sorting according to the column selected
 * Pagination is provided to see next records.
 * On account name, link is provided to go on that account page.
 */ 
public class AccountComponentController {
    
    /* to get all accounts */
	public List<Account> accountList { get; set; }
    /* total records available */
    private integer totalRecs = 0;
    /* offset indicating starting list record */
    private integer OffsetSize = 0;
    /* limit size : no of records shown at one page */
    private integer LimitSize = 10;
    /* sort type of records */
    private String sortType = 'ASC';
    /* Sort field on the basis of which sorting is done */
    private String sortField = 'Name';
    
    /*
     * default constructor initializing value of total records
     */ 
    Public AccountComponentController() {
        totalRecs = [select count() from account];
        fetch();   
    }
    
    /*
     * fetching all accounts according to sort type, limit and offset.
     */
    private void fetch() {
        String query = 'SELECT Name, AccountNumber, AnnualRevenue, BillingCity FROM Account ORDER BY ' + sortColumn  + ' ' + sortType + ' LIMIT ' + LimitSize + ' OFFSET ' + OffsetSize;
        System.debug('Offset is '+ OffsetSize +' '+query);
        accountList = Database.query(query);
    }
    
    /*
     * first page content
     */ 
    public void FirstPage() {
        OffsetSize = 0;
        System.debug('in first page Offset is '+ OffsetSize );
        fetch();
    }
    
    /*
     * previous page content
     */
    public void previous() {
        OffsetSize = OffsetSize - LimitSize;
        System.debug('in prev Offset is '+ OffsetSize );
        fetch();
    }
    
    /*
     * next page content
     */
    public void next() {
        OffsetSize = OffsetSize + LimitSize;
        System.debug('in next Offset is '+ OffsetSize );
        fetch();
    }
    
    /*
     * Last page content
     */
    public void LastPage() {
        OffsetSize = totalrecs - math.mod(totalRecs, LimitSize);
        System.debug('in last page Offset is '+ OffsetSize );
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
    
    /*
     * function sets value of sort type along with returning sort field
     * Returns : the value of sort field.
     */ 
    public String sortColumn {
        get { return sortField; }
        
        set {
            if (value == sortField)
                sortType = (sortType == 'ASC')? 'DESC' : 'ASC';
            else
                sortType = 'ASC';
            sortField = value;
        }
    }
    
    /*
     * Returns sort type for particular column
     */ 
    public String getSortType() {
        if (sortColumn == null || sortColumn == '')
            return 'ASC';
        else
            return sortType;
    }
    
    /*
     * Sets sort type value
     */ 
    public void setSortType(String value) {  
        sortType = value;
    }
    
    /*
     * Sets account list value 
     * Returns : page reference.
     */ 
    public PageReference sortData() {
        accountList = Database.query('SELECT Name, AccountNumber, AnnualRevenue, BillingCity FROM Account ORDER BY ' + sortColumn  + ' ' + sortType + ' LIMIT ' + LimitSize + ' OFFSET ' + OffsetSize);
        return null;
    }
}