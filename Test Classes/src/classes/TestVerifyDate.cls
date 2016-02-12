@isTest public class TestVerifyDate {
    @isTest static void testDate1(){
        Date date1 = Date.newInstance(2016, 3, 12);
        Date date2 = Date.newInstance(2016, 1, 12);
        Date expected = Date.newInstance(2016, 3, 31);
        Date actual = VerifyDate.CheckDates(date1, date2);
      System.assertEquals(expected, actual);
    }
    
      @isTest static void testDate2(){
        Date date1 = Date.newInstance(2016, 3, 12);
        Date date2 = Date.newInstance(2016, 3, 14);
       
        Date actual = VerifyDate.CheckDates(date1, date2);
      System.assertEquals(date2, actual);
    }
}