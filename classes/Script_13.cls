public class Script_13 
{
    public Static void printFibonacciSeries()
    {
        Integer firstVar = 1,secondVar = 0,result = 0;
        for(Integer inc = 0;inc<10;inc++)
        {
            
        	result = firstVar +secondVar;
            System.debug( result);
        	secondVar = firstVar;
            firstVar = result;
        	
        	
            
        }
        
        
        
        
    }

}