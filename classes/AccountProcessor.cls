public class AccountProcessor {
    @future
    public static void countcontacts(List<Id> accountId)
    {
        List<Account> accountrec = [Select name,(select name from contacts) from account where id in: accountId];
        List<Account> upd = new  List<Account>();
        Account acc = new Account();
        for(account counter: accountrec)
        {   
             
            acc.Id = counter.Id;
            acc.Number_of_Contacts__c = counter.contacts.size(); 
            upd.add(acc);
            
        }
        
        update upd;
        
        
        
    }
    
    
    
    
}