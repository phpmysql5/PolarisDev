public with sharing class accountCTRL {
    public static List<Account> findAccounts(String searchKey)
    {
      String key = '%' + searchKey+'%';
      return [Select ID,Name,AccountNumber FROM Account WHERE Name LIKE:Key limit 10];
    }
    
}