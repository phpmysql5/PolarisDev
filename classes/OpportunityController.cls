public class OpportunityController {
    
    @AuraEnabled
    public static List<Opportunity> getAllOpportunities()
    {
        return [select name,stageName,amount from opportunity];
    }
    
      @AuraEnabled
    public static List<Opportunity> getAllOpportunitiesClosedWon()
    {
        return [select name,stageName,amount from opportunity where stageName='Closed Won'];
    }


}