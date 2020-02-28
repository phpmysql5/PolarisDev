public class dynamica {
    
 @AuraEnabled   
    public static List<String> showdata()    
    {
		
       
        Set<String> configFields = configuration__c.sObjectType.getDescribe().fields.getMap().keySet();
        List<String> setToList = new  List<String>();
        setToList.addAll(configFields);       
        return setToList;
        

    }
    
@AuraEnabled
    public static configuration__c getAccount()
    { 	
        configuration__c a = new configuration__c();
        return a;
    }
}