public class GitController {
    
  /** @AuraEnabled
    public static List<String> getPickValues() { 
        List<Schema.PicklistEntry> values = GitUser__c.NID__c.getDescribe().getPicklistValues();
        
        List<String> sendPickValues = new List<String>();
        for(Integer i = 0;i<values.size();i++)
        {
            sendPickValues.add(values[i].getValue());
        }
        
        return sendPickValues;    
   }**/
    
     @AuraEnabled
    public static String checkNID(String NID,String Branch)
    {
        List<GitUser__c> CS = [SELECT ID,NID__c FROM GitUser__c Where NID__c =: NID  ];
         //List<Git__c> CS2 = [SELECT ID,NID__c FROM Branch Where  NID__c =: NID AND  SetupOwnerId = :UserInfo.getProfileId()];
        
        System.debug(Branch);
        String OwnerId = UserInfo.getProfileId(); 
        String queryStr='SELECT ID,NID__c FROM ' +Branch+ ' Where  NID__c =:NID AND  SetupOwnerId =:OwnerId';
       List<SObject> CS2=Database.query(queryStr);
        
        String currentNID = 'CurrentNID';
        String correctNID = 'CorrectNID';
        if(CS.size()==1)
        {
             if(CS2.size()==1)
             {
                 return currentNID;
             }
             return correctNID;
        }
         return '';
     
    }
    

   
    
    @AuraEnabled
    public static String loadLockStatusPath1()
    {
         String message;
         Git__c CS = new Git__c();
        try
        {
          CS = [SELECT NID__c FROM Git__c Where SetupOwnerId = :UserInfo.getProfileId()  ];
        }
        catch(System.QueryException e){
            
        }
         if(CS.NID__c==NULL)
         {
             message = 'There is no lock at present';
         }
        else
        {
            message = CS.NID__c +' has locked at present';
        }
        System.debug(message);
        return message; 
         
    }
    
     @AuraEnabled
    public static String loadLockStatusPath2()
    {
         String message;
        Git2__c CS = new Git2__c();
        try
        {
          CS = [SELECT NID__c FROM Git2__c Where SetupOwnerId = :UserInfo.getProfileId()  ];
        }
        catch(System.QueryException e){
            
        }
         if(CS.NID__c==NULL)
         {
             message = 'There is no lock at present';
         }
        else
        {
            message = CS.NID__c +' has locked at present';
        }
        
        return message; 
         
    }
   
    @AuraEnabled
    public static String checkToLock(String NID,String Branch)
    {
        String messageToDisplay = '';
        //Git__c CS = [SELECT Id, NID__c,Status__c,LastModifiedDate FROM Git__c Where SetupOwnerId = :UserInfo.getProfileId()    FOR UPDATE];
        
        String OwnerId = UserInfo.getProfileId(); 

        String queryStr='Select Id, NID__c,Status__c FROM ' +Branch+ ' Where  SetupOwnerId =:OwnerId  FOR UPDATE';
        
        Schema.SObjectType GIT = Schema.getGlobalDescribe().get(Branch);
        SObject CS = GIT.newSObject();
        
        
         try
        {  
           CS=Database.query(queryStr);
           System.debug(CS);
        }
        catch(System.QueryException e){
            
        }
        
      
        if(CS.get('NID__c')==NULL)
        {   
            CS.put('NID__c', NID);
            CS.put('Status__c', True);
            update CS;
            messageToDisplay =NID +' , you have locked this branch';
            
        }
        else
        {
           messageToDisplay ='Sorry !'+ CS.get('NID__c') +' has locked this branch';
        }
        System.debug(messageToDisplay); 
        return  messageToDisplay;
        
    }
    
     @AuraEnabled
     public static String checkToUnlock(String NID,String Branch)
    {
        String messageToDisplay = '';
        String OwnerId = UserInfo.getProfileId(); 
        String queryStr='Select Id, NID__c,Status__c,LastModifiedDate FROM ' +Branch+ ' Where  NID__c =:NID AND  SetupOwnerId =:OwnerId  FOR UPDATE';
         Schema.SObjectType GIT = Schema.getGlobalDescribe().get(Branch);
        SObject CS = GIT.newSObject();
        
        
         try
        {  
           CS=Database.query(queryStr);
        }
        catch(System.QueryException e){
            
        }
        
        if(CS.get('NID__c') == NID)
        {
            CS.put('NID__c', Null);
            CS.put('Status__c', false);
            update CS; 
            messageToDisplay = NID +' , you have unlocked this branch';
            System.debug(messageToDisplay);
        }
         else
        {
           messageToDisplay ='Sorry !'+ CS.get('NID__c') +' has locked this branch';
        }
        System.debug( messageToDisplay);
        return messageToDisplay;
    }
    
   
      /**public static String lockInEmergency(String NID,String Branch)
    {
        String messageToDisplay = '';
        String OwnerId = UserInfo.getProfileId(); 
        String queryStr='Select Id, NID__c,Status__c,LastModifiedDate FROM ' +Branch+ ' Where  SetupOwnerId =:OwnerId  FOR UPDATE';
         Schema.SObjectType GIT = Schema.getGlobalDescribe().get(Branch);
        SObject CS = GIT.newSObject();
        
        
         try
        {  
           CS=Database.query(queryStr);
        }
        catch(System.QueryException e){
            
        }
        

            CS.put('NID__c', NID);
            CS.put('Status__c', true);
            update CS; 
            messageToDisplay = NID +' , you have locked this branch in emergency';
            System.debug(messageToDisplay);
        

        System.debug( messageToDisplay);
        return messageToDisplay;
    }
    **/

    
    

}