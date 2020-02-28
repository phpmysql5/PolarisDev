public class ContactController2 {

    @AuraEnabled
   public static String createContact(Contact con)
   {
       
       try
       {
           insert con;
           return 'Contact created successfully';
       }
       catch(DmlException ex)
       {
           System.debug('Problem in insertion '+ex.getMessage());
           return 'Could not create contact';
           
       }
       
      
   }
}