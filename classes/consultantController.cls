public class consultantController {
    
      @AuraEnabled
    public static List < Consultant__c > fetchConsultants() {
        
        return [ SELECT Id, 
                		Name,
                		Phone__c,
                		Preferred_Location__c,
                		Primary_Skill__c,
                		Relevant_Experience__c,
                        Total_Experience__c
                        FROM Consultant__c LIMIT 10 ];
        
        
    }
    


}