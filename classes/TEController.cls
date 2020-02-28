public class TEController {
    
 
    @AuraEnabled
    public static List<TaskEventWrapper> getAllTasksEvents(String task,String option)
{   
    List<TaskEventWrapper> ListTasks = new  List<TaskEventWrapper>();
    TaskEventWrapper tc = new TaskEventWrapper();
    tc.sobjList = new List<sObject>();
    
    //tc.taskList = [select id, whatid from task where what.type =: objectApi];
    //tc.eventList = new List<event>();
    //tc.eventList = [select id ,whatid from event where  what.type =: objectApi ];

	tc.sobjList = Database.query('SELECT Id FROM '+task+'  WHERE what.type =:option');
    ListTasks.add(tc);
    return ListTasks;
}    

}