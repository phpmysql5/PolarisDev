public class RecordController {
    @AuraEnabled
 
    public static List<List_of_Students__c> getRecords()
    {
        return [Select id,Name__c,Middle_Name__c,LastName__c 
                from List_of_Students__c];
    }
     
    // @AuraEnabled
   // public static List_of_Students__c setRecords(List_of_Students__c listRec)
    //{
      //  upsert listRec;
       // return listRec;
    //} 
 

    
}