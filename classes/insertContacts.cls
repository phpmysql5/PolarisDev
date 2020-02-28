public class insertContacts {
    
    @AuraEnabled
    public static Contact addLastNamecontacts(String LastName)    
    {    
        Contact con = new Contact(LastName=LastName, AssistantName='karthik');
        insert con;
        return con;
    }

}