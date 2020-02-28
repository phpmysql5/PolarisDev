public class Script_12 
{
    public static void printAccountNameInRev()
    {
        List<Account> accountNames = [Select name from Account ];
        for(Account accname :accountNames )
        {
            System.debug(accname.name.reverse());
        }
        
    }

}