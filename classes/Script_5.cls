public class Script_5 
{

    public Static List<Account> getAllContactsHavingA()
    {
        list<Account> accountsHavingA = [Select Id from Account where name LIKE'%A%'];
        Database.delete(accountsHavingA,false);
        return accountsHavingA;
        
        
    }
}