@isTest
public class testqueueable {
 
    
      @isTest static void testQ()
    {list<account> acc  = new list<account>();
        for(integer i =0;i<50;i++)
        {
            account a = new account(name = 'acc' + i,BillingState='NY');
            acc.add(a);
        }
   
     
     for(integer i =0;i<50;i++)
        {
            account a = new account(name = 'acc' + i,BillingState='CA');
            acc.add(a);
        }
     insert acc;
     
   
       String strState = 'CA';
     Contact conta = new contact(lastname ='asas');
     
     AddPrimaryContact ap = new AddPrimaryContact(conta,'CA');
     
     
     Test.startTest();
  System.enqueueJob(ap);
     Test.stopTest();
     
     System.assertEquals(50,[select count() from contact where accountId in (select id from account 
                                                                             where BillingState=:strState)]);
     

    }

}