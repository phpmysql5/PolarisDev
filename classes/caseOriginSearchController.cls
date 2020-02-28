public class caseOriginSearchController {
    
    
    @AuraEnabled
    public static List<String> getPickValues() { 
        List<Schema.PicklistEntry> values = Case.Origin.getDescribe().getPicklistValues();
        
        List<String> sendPickValues = new List<String>();
        for(Integer i = 0;i<values.size();i++)
        {
            sendPickValues.add(values[i].getValue());
        }
        
        return sendPickValues;    
   }
    
    
    @AuraEnabled
 public static List < Case > fetchCases(String searchKeyWord) {
  
  List < Case > newCaseList = new List < Case > ();
  List < Case > casesList = [select id, caseNumber,Origin, Reason, status from Case
                                   where Origin =: searchKeyWord LIMIT 100];
     System.debug('karthik'+searchKeyWord);
 
  for (Case caseRec: casesList) {
   newCaseList.add(caseRec);
  }
  return newCaseList;
 }
    
    
   
    
    

}