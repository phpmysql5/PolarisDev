trigger ConfirmationEmail_Trigger on Lecturer_with_Session__c (after insert,after update) 
{
   
     List<Id> lecturerWithSessionIDList;
    for(Lecturer_with_Session__c LecturerId : Trigger.New )
    {    
      	
        lecturerWithSessionIDList= new List<Id>();
        lecturerWithSessionIDList.add(LecturerId.Id);
        
    }

    List<Lecturer_with_Session__c> LecturerList = [SELECT Lecturer__r.first_Name__c,
                                                          Lecturer__r.last_Name__c,
                                                          Lecturer__r.email__c,
                                                          Class__r.subject__c,
                                                          Class__r.level__c,
                                                          Class__r.session_time__c 
                                                  FROM Lecturer_with_Session__c 
                                                  WHERE id in:lecturerWithSessionIDList and Lecturer__r.Email__c <> NULL];
            String[] addresses = new String[]{};
            String[] subject= new String[]{};
            String[] messages = new String[]{};
    
 for(Integer i =0;i<LecturerList.size();i++ )
    {
              
            addresses.add(LecturerList[i].lecturer__r.email__c);
            subject.add(LecturerList[i].class__r.subject__c);
            String message = 'Hi '+ LecturerList[i].lecturer__r.first_name__c + ',You have been assigned this session' + LecturerList[i].class__r.session_time__c;
            messages.add(message);
        
  
        }
    EmailManager.sendMail(addresses,subject,messages);
    }