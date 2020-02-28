@isTest
public class LeadProcessorTest {
    @testSetup
    
    static void setup()
    {
        List<Lead> leads = new List<Lead>();
        for(integer i = 0; i<200; i++)
        {
            Lead lead = new Lead(leadSource='Dreamforce',lastname='karthik',company='Accenture');
            leads.add(lead);
            
        }
        insert leads;
    }
    
    static  testMethod void test()
    {
        Test.startTest();
        LeadProcessor leadPrc = new LeadProcessor();
        Id batchId = Database.executeBatch(leadPrc);
        Test.stopTest();
        
        System.assertEquals(200,[select count() from lead where LeadSource ='Dream'] );
    }

}