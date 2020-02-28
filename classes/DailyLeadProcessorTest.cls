@isTest
private class DailyLeadProcessorTest {
    
    public static string CRON_EXP = '20 59 7 21 8 ? 2017';
    static testMethod void testSceduledJob()
    {
        List<Lead> leadRec = new List<Lead>();
          
        for(Integer i = 0;i<200;i++)
        {
            Lead leads  =  new Lead(lastname='shettyan',company = 'Accenture');
            leadRec.add(leads);
        }
        insert leadRec;
         
        
        //we are getting the lead Ids
        Map<Id, Lead> LeadMap = new Map<Id, Lead>(leadRec);
        List<Id> LeadIDs  =  new List<Id>(LeadMap.keySet());
        
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',CRON_EXP,new DailyLeadProcessor());
        List<Task> taskList =[Select id from task where whatid in: LeadIDs ];
        System.assertEquals(0, taskList.size(), 'Tasks exist before job has run');
        Test.stopTest();
        
        
        


        
    }
    
    
    

}