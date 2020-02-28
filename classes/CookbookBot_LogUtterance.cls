public class CookbookBot_LogUtterance {
    
    public class LogInput{
        @InvocableVariable(required=false)
        public String sCurrentUtterance;
        
        @InvocableVariable(required= true)
        public String sAgentLiveTranscriptId;
    }
    
    @InvocableMethod(label ='Log Utterance')
    public static  void logUtterance(List<LogInput> inputParameters)
    {
        String sCurrentUtterance = inputParameters[0].sCurrentUtterance;
        String sAgentLiveTranscriptId = inputParameters[0].sAgentLiveTranscriptId;
        
        Utterance_Log__c logRecord = new Utterance_Log__c();
        logRecord.Current_Utterance__c = sCurrentUtterance;
        logRecord.Chat_Transcript__c = sAgentLiveTranscriptId;
        
        insert logRecord;
    }
    

}