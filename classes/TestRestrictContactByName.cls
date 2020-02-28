@isTest
public class TestRestrictContactByName {
    @isTest static void contactupsert()
    {
    //list <contact> con = new list<contact>();

    contact con = new contact(LastName = 'INVALIDNAME');

        Test.startTest();
        Database.UpsertResult result = database.upsert(con,false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assertEquals('The Last  "'+con.LastName+'" is not allowed for DML',result.getErrors()[0].getMessage());




        
        
        
}
}