public class AccountHandler {
    public static Account insertNewAccount(String accname)
    {
        
        Account acc = new Account(name = accname );
       try{
            insert acc;
            return acc;
        }
        catch(Exception ex)
        {
          system.debug(ex.getMessage());
          return null;  
        }
        
        
        
         }

}