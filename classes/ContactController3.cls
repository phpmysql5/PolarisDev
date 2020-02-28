public with sharing class ContactController3 
{
    @AuraEnabled
    public static list<Contact> getContacts()
    {
        List<Contact> contacts = [Select id,name,mailingstreet,phone,email,leadsource from contact];
        return contacts;
    }
   
    

}