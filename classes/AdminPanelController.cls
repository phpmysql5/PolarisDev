public class AdminPanelController {
    
    @AuraEnabled
    public static List<AdminPanelWrapper> getRecords()
    {
         List<AdminPanelWrapper> configwrap = new List<AdminPanelWrapper>();
         List<configuration__c> config  = [Select ISBOY__c,ISGirl__c from configuration__c ];
        
        if(config!= null && config.size() > 0){
             for(configuration__c c :config)
             {
                AdminPanelWrapper configrec  = new AdminPanelWrapper();
                configrec.ISBOY = c.ISBOY__c;
                configrec.ISGirl = c.ISGirl__c;
                configwrap.add(configrec);
    		 }
    
            
		}
         return configwrap;
        
    }
}