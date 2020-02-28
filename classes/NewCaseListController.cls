public class NewCaseListController {

  

  
    public  list<case> getNewCases()
    {
      list<case> newcases = new list<case>();
        newcases = [Select ID,CaseNumber from case where status ='New' ];
return newcases;
      
        
    }
}