@isTest
public class LeadTest {
    @testSetup
       static void setup()
        {
            List <lead> l = new list<lead>();
            for(integer i=0;i<200;i++)
            {
                l.add(new lead(leadsource='Dreamforce',company='qqqqqqq',lastname='sjhjdsd'));
                
            }
            insert l;
  
        }
        
        static testmethod void leadtest()
        {
            Test.startTest();
            LeadProcessor l = new LeadProcessor();
            Id batchId = Database.executeBatch(l);
            Test.stopTest();
            
            System.assertEquals(200, [select count() from Lead where LeadSource='Dream']);
        }
    

}