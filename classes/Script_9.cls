public class Script_9 
{
 
    public static void arrangeAccountInAlphaAsc()
    {
        List<Account> accountsInAlphaAsc = [Select Name from Account order by Name Asc ]; 
        for(Account account : accountsInAlphaAsc)
        {
            System.debug(account.name);
        }
       
    }
   

}