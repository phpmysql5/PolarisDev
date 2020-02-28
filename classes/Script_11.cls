public class Script_11 
{
    public static  void printSeries()
    {   
        Decimal firstvar = 1;
        Decimal SecondVar = 1; 
        for( Integer i =0 ;i<10;i++)
        {
            Decimal result =  firstvar + SecondVar;
            firstvar = result.pow(2);
            System.debug(firstvar);
            
        }
        
    }
    

}