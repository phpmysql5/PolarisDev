public class GetData {
    @AuraEnabled
    public static list<Account> getAccountList()
    {
        return [Select name,phone,accountNumber from Account];
    }
    
    @AuraEnabled
      public static List<Contact> getContactList(String AccountId)
    {   List<Contact> conList = new  List<Contact>();
         Contact contact = new Contact();
        Account acc = [Select (Select Name from Contacts) from Account where Id =: AccountId ];
      for(Contact con : acc.Contacts)
      {
          conlist.add(con);
      }
        return conList;
     
        
    }

}