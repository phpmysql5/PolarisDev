trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    
   Opportunity[] opp = Trigger.new;
     List<Task> test = new List<Task>();
   
    
    for( Opportunity o: opp)
    {
        if(Trigger.isInsert || Trigger.isUpdate)
        {
            if(o.StageName=='Closed Won')
            {test.add(new task(WhatId=o.id,Subject = 'Follow Up Test Task'));
  
              
            }
        }
    }
   if (test.size() > 0) {

        insert test;

    }

}