public with sharing class contactCtrl {

@AuraEnabled
public static List<Contact> getContactList(){

  return [SELECT Id, Name, Title, Phone, Email, Picture__c FROM Contact  LIMIT 10];
  
}
}