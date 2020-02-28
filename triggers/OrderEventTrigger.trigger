trigger OrderEventTrigger on Order_Event__e (after insert) {
    
    List<Task> taskList  = new List<Task>();
    Order_Event__e newsEvent = new Order_Event__e(has_shipped__c = true);
    EventBus.publish(newsEvent);
    for(Order_Event__e event :Trigger.new)


    {
        if(event.has_shipped__c = true)
    {
        Task task = new Task(priority = 'Medium',status = 'New',subject = 'Follow up on shipped order ' + 
                             event.Order_Number__c,ownerId =UserInfo.getUserId() );
        taskList.add(task);
    }
        
    }
    insert taskList;
    

}