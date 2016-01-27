/* class to parse object into Json value */
public class ConvertJsonController {
   
   /* String which will have Json value of object */ 
   public String text1 {get;set;}
   
   /* Default Constructor */ 
   public ConvertJsonController(){ 
   }    
   
   /* Function which will parse account object into Json value */ 
   public void parseJson()
   {
       String soql = 'SELECT Name FROM Account LIMIT 5';
       List<Account> acct = Database.Query(soql); 
       text1 = JSON.serializePretty(acct);
   }    
}