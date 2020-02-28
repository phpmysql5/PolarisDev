global class LeadProcessor implements Database.Batchable<sObject> ,Database.stateful {
    
  global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            
            'SELECT name from Lead'
        );
  }
      global void execute(Database.BatchableContext bc, List<Lead> scope)
      {
          List<Lead> listLeads = new List<Lead>();
          for(Lead lead: scope)
          {
              lead.LeadSource = 'Dreamforce';
              listLeads.add(lead);
              
          }

          update  listLeads;
          
          
          
          
          
      }
    
    
     global void finish(Database.BatchableContext bc){

    }


    
    


}