public class CookbookBot_HandleIntentDetectFailure {
    
    public class HandleInput
    {
        @InvocableVariable(required=false)
        public String sCurrentUtterance;
        
        @InvocableVariable(required=false)
        public String sLiveChatTranscriptId;
    }
    
    public class HandleOutput
    {
        @InvocableVariable(required = true)
        public String sTransferMessage;
        
        @InvocableVariable(required = true )
        public Boolean bTransferRequired;
    }
    
    @InvocableMethod(label ='Handle Intent Detection Failure')
    public static list<HandleOutput> handleIntentDetectionFailure(List<HandleInput> inputParameters)
    {
      String sCurrentUtterance = inputParameters[0].sCurrentUtterance;
      String sLiveChatTranscriptId = inputParameters[0].sLiveChatTranscriptId;
        
      List<HandleOutput> outputParameters = new List<HandleOutput>();
      HandleOutput outputParameter = new HandleOutput();
      outputParameter.bTransferRequired = false;
      outputParameter.sTransferMessage = '';
      
     List<Utterance_Log__c> undetectedUtterances = [Select Current_Utterance__c,createdDate from utterance_log__c 
                                                    where Chat_Transcript__c =:sLiveChatTranscriptId
                                                    Order by CreatedDate Desc];
      
       if(undetectedUtterances.size()>=2)
       {
           if(undetectedUtterances.size() > 5)
           {
               outputParameter.bTransferRequired = true;
               outputParameter.sTransferMessage ='Let me find one of our specialists to help you';
		   }
           
           else
           {
               Utterance_Log__c thisUtterance = undetectedUtterances[0];
               Utterance_Log__c lastUtterance = undetectedUtterances[1];
           
           if(thisUtterance.CreatedDate < lastUtterance.CreatedDate.addSeconds(20))
           {
               outputParameter.btransferRequired = true;
               outputParameter.sTransferMessage = 'Im having troubles understanding what you need.Let me find a specialist';
           }
            
               

       }
      
    }
    
       outputParameters.add(outputParameter);      
       return outputParameters;

    }
      
        
        
    
  

}