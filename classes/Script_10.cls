public class Script_10 
{
    public static void printConAlphaInCaps()
    { 
       List<Contact> conList = [Select Id,FirstName,LastName FROM Contact];
        
       for(Contact conObj: conList)
       {          
          System.debug(conObj.FirstName);
           if(conObj.FirstName !=null)
           {
          System.debug(conObj.FirstName.capitalize());
           }
       }
        
        
        
    }

}