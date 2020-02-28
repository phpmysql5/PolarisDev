public class ContactAndLeadSearch {

    public static List<List< SObject>> searchContactsAndLeads  (String find2)
    {
        List<List<sObject>> searchList = [FIND :find2 IN ALL FIELDS RETURNING Contact(LastName),Lead(LastName)];
     
        //List<List<sObject>> searchList = null;//[FIND :find2 IN ALL FIELDS RETURNING Contact(LastName)];
         System.debug('**********'+ searchList);
   return searchList;
       
    
        
    }

}