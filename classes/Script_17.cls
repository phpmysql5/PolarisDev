public class Script_17 {
    public static void getDiffInYMDHMS()
    {
        
        DateTime startDate = DateTime.newInstance(2016, 1, 2, 6, 7, 55);
        DateTime enddate = DateTime.newInstance(2016, 2, 5, 7, 8, 55);
        Date start = Date.valueOf(startDate);
        Date endD =  Date.valueOf(enddate);
       
        
        Integer numOfDays   = start.daysBetween(endD) ;
        Integer numOfMonths = start.monthsBetween(endD);
        Integer numOfYears  = endD.year() - start.year();

        
        System.debug(numOfDays);
        System.debug(numOfMonths);
        System.debug(numOfYears);

       // Integer Hours =   startDate.hour();
      
        Time endDateTime  = endDate.time();
      
        
        
        Time endtime  = endDate.time();
        Integer hour =  endDate.hour() - startDate.hour();
        hour = hour+ numOfDays *24; 
        Integer sec  =hour * 60 * 60;
        Integer min  =hour * 60 ;
        System.debug(hour);
        System.debug(min);
        System.debug(sec);
        
 
    }

}