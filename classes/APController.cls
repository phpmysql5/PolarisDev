public class APController {
    
    private static configuration__c configSetting = configuration__c.getInstance();
    @AuraEnabled
    public static configuration__c  showData()
    {
        Set<String> configFields = configuration__c.sObjectType.getDescribe().fields.getMap().keySet();
        List<String> setToList = new  List<String>();
        setToList.addAll(configFields);
        
        for(Integer i=8;i>=0;i--)
            {
            setToList.remove(i);
        	}
        
		
        
        configuration__c  config = [select ISBOY__c,ISGirl__c from  Configuration__c where  SetupOwnerId =: UserInfo.getUserId()];
        return config;
        
        

		}
      
    @AuraEnabled
    public static void  updateData(List<Boolean> result)
    { 

        Configuration__c config = [select Id,ISBOY__c,ISGirl__c from  Configuration__c where  SetupOwnerId =: UserInfo.getUserId()  ];

        List<STRING> configList = new List<STRING>();
        //configList =  APController.showData();

        config.ISBOY__c = result.get(0);
        config.ISGirl__c = result.get(1);
        update config;
 
    }
    
}