public class TaskEventController 
{
    
    @AuraEnabled
    public static List<TaskEventWrapper> getAllTasksEvents(String objectApi)
{   
    List<TaskEventWrapper> ListTasks = new  List<TaskEventWrapper>();
    TaskEventWrapper tc = new TaskEventWrapper();
    tc.taskList = new List<task>();
    tc.taskList = [select id, whatid from task where what.type =: objectApi];
    tc.eventList = new List<event>();
    tc.eventList = [select id ,whatid from event where  what.type =: objectApi ];
    ListTasks.add(tc);
    return  ListTasks;
}
    
}