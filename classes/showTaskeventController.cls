public class showTaskeventController {
    
     @AuraEnabled
    public static List<TaskEventWrapper>  getAllTasksEvents(list<String> temp ,String objectApi )
{   
    
    List<TaskEventWrapper> ListTasks = new List<TaskEventWrapper>();
    TaskEventWrapper tc = new TaskEventWrapper();
    tc.sobjList = new List<sObject>();
    
    for(String i : temp)
    {
   	if( i =='task')
   	{
       tc.taskList = new List<Task>();
       tc.taskList = [select id, whatid from task where what.type =: objectApi];
       tc.sobjList.addAll((List<sObject>)(tc.taskList));
   	}
       
       if( i == 'event')
       {
           
           tc.eventList = new List<event>();
           tc.eventList = [select id, whatid from event where what.type =: objectApi];
           tc.sobjList.addAll((List<sObject>)(tc.eventList));
       
       }
        
       if( i =='note')
   	{
       tc.noteList = new List<sobject>();
       //tc.noteList = [select id from note where parentId in (Select id from objectApi)];
	   //tc.noteList = Database.query('SELECT Id FROM objectApi ');
	   
       String queryStr='select  id from note where parentId in (Select id  from '+ objectApi +')';
        				
	  tc.noteList = Database.query(queryStr);
        
       tc.sobjList.addAll((List<sObject>)(tc.noteList));
   	}
       
        
       
       if( i =='email')
   	{
       tc.emailList = new List<sobject>();
       //tc.noteList = [select id from note where parentId in (Select id from objectApi)];
	   //tc.noteList = Database.query('SELECT Id FROM objectApi ');
	   
       String queryStr='select Id from  EmailMessage  where  RelatedToId in (select id from '+ objectApi +')';
        				
	   tc.emailList = Database.query(queryStr);
        
       tc.sobjList.addAll((List<sObject>)(tc.emailList));
   	}
       
   
    } 
 
    
    //tc.taskList = [select id, whatid from task where what.type =: objectApi];
    //tc.eventList = new List<event>();
    //tc.eventList = [select id ,whatid from event where  what.type =: objectApi ];

	//tc.sobjList = Database.query('SELECT Id FROM '+task+'  WHERE what.type =:option');
 
    
    ListTasks.add(tc);
    return ListTasks;
}

}