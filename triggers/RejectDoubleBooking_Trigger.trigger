trigger RejectDoubleBooking_Trigger on Lecturer_with_Session__c (before insert,before update) 
{
    List <Id> LecturerIdList = new List<Id>();
    Map <Id,Datetime>  requestedbooking = new  Map <Id,Datetime>();
    
    for(Lecturer_with_Session__c lecwithSec :Trigger.New)
    {
        LecturerIdList.add(lecwithSec.lecturer__c);
        requestedbooking.put(lecwithSec.Class__c,null);
        
    }
    
    List<Class__c> sessionList = [Select id , level__c,subject__c,session_time__c from class__c where id in:requestedbooking.keySet()];
    for(Class__c classObj: sessionList)
    {
         requestedbooking.put(classObj.id,classObj.session_time__c);
    }
    
    List<Lecturer_with_Session__c> lecList = [SELECT id,lecturer__r.first_name__c ,
                                              lecturer__r.last_name__c ,
                                              lecturer__r.email__c,
                                              class__r.subject__c,
                                              class__r.level__c,
                                              class__r.session_time__c
                                              FROM Lecturer_with_Session__c  WHERE lecturer__c IN :LecturerIdList];
    
    
    for(Lecturer_with_Session__c lecsec : trigger.new)
    {
       Datetime sessiondatetime = requestedbooking.get(lecsec.Class__c);
       
        for(Lecturer_with_Session__c relatedLectures : lecList)
        {
            
            if(lecsec.Lecturer__c ==relatedLectures .Lecturer__c && 
               relatedLectures.class__r.session_time__c == sessiondatetime )
            {
                lecsec.addError('The lecturer is already booked');
            }
            
        }
       
    }
    
        
    
    
    
    
    
    
    
}