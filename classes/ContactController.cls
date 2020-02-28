public with sharing class ContactController {
    @AuraEnabled
    public static list<contact> findAll() //for ContactList component
    {
        return[select id,name,phone from contact limit 50];
        
    }  
    @AuraEnabled
    public static list<contact>  findByName(String searchKey) //for searchBar component
    {
        String findword = '%'+ searchKey + '%';
        return[select id,name,phone from contact where name like:findword limit 50];
    }
    
    @AuraEnabled
    public static contact findById(String contactId) //for ContactDetails component
    {    
       
        return [select id,name,title,phone,mobilephone,account.name from Contact where id=:contactId];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [SELECT Id, FirstName, LastName,OwnerId, Title, Phone, Email FROM Contact LIMIT 10];
    }
    

}