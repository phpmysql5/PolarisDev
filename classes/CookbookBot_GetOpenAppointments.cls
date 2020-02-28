public with sharing class CookbookBot_GetOpenAppointments {
    
    @InvocableMethod(label='Get Open Appointments')
    public static List<List<Bot_Appointment__c>> getOpenAppointments(List<String> emails){
        
        String sEmail = emails[0];
        List<Bot_Appointment__c> appointments = [SELECT Id, Name, JobType__c, 
                                                    AppointmentDate__c, AppointmentSlot__c 
                                             FROM Bot_Appointment__c 
                                             WHERE Contact__r.Email =:sEmail 
                                             AND Status__c IN ('New','Scheduled')];
        List<List<Bot_Appointment__c>> appointmentList = new List<List<Bot_Appointment__c>>();
        
        appointmentList.add(appointments);
        return appointmentList;

    }
    
   

}