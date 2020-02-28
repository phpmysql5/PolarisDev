global class DailyLeadProcessor implements Schedulable {
    
     global void execute(SchedulableContext ctx) 
     {
         List<Lead> blankLeadSourceList = [select name from Lead where LeadSource =Null limit 200];
         List<Lead> leadRecord = new List<Lead>();
         for(Lead leadRec :blankLeadSourceList )
         {
             leadRec.LeadSource  = 'Dreamforce';
             
             leadRecord.add(leadRec);
             
             
         }
       
        update leadRecord ;
       
         
         
       

         }
         
     }