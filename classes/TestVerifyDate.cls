@isTest
public class TestVerifyDate {
    @isTest static void testdates()
    {
        date resultdate =   VerifyDate.CheckDates(Date.newInstance(2015, 1, 1),Date.newInstance(2015, 1, 6));
        system.assertEquals(Date.newInstance(2015, 1, 6), resultdate);
         date resultdate2 =   VerifyDate.CheckDates(Date.newInstance(2015, 1, 1),Date.newInstance(2015, 2, 6));
        system.assertEquals(Date.newInstance(2015, 1, 31), resultdate);
         

        
         
        
        
        
    }

}