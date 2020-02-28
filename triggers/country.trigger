trigger country on Capital__c (after insert, after update) {

        
    C__c c = new C__c();
    for(Capital__c  cap :Trigger.new)
    {
    
    c.Id = cap.Country__c;
        c.Countries__c =cap.Capital_Names__c;
    
        
       
        update c;
    }

    
}