public class CampingListController {
    @AuraEnabled
public static list<Camping_Item__c> getItems(){

    System.debug('Method is invoked');

    return ([select Name,Packed__c,Price__c,Quantity__c from Camping_Item__c]);

}


@AuraEnabled
public static void saveItem(Camping_Item__c strcamp){

    //Camping_Item__c ci     = (Camping_Item__c)JSON.deserialize(strcamp,Camping_Item__c.class);
   
    //System.debug('Inserted Camping Item  : ' + ci);
   
    insert strcamp;

}

}