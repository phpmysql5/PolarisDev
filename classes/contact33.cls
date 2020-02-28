public with sharing class contact33 {
    
    @AuraEnabled
    public static list<contact> getContacts()     
    {
        List<Contact> contacts = [Select id,name,mailingstreet,phone,email,leadsource from contact];
        return contacts;
    }

}