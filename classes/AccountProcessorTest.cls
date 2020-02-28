@istest
public class AccountProcessorTest {
   
    public static testmethod void testaccounts()
    {
      Account account12 = new Account(name ='sdsd'); 
        insert account12;
     Contact contact1 = new Contact(lastname ='karthik90');
        
        
        contact1.AccountId = account12.Id;
        insert contact1;
        Id pid =  account12.Id;
      
        List<Id> acc = new List<Id>();
        acc.add(pid);
        
        Test.startTest();
        AccountProcessor.countcontacts(acc);
        Test.stopTest();
        
      // System.assertEquals(3, account12.Number_of_Contacts__c);

        
        

        
    }

}