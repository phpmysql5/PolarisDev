global with sharing class PendingEmailBatch implements Database.Batchable<Colleagues__c>{
 
   global Iterable<Colleagues__c> start(Database.BatchableContext BC) {
        Colleagues__c[] q = [SELECT id,Name,Pending_amount__c,email__c FROM Colleagues__c WHERE Pending_amount__c=500];
                                   
        return q;
    }
  
    global void execute(Database.BatchableContext BC, List<Colleagues__c> scope) {
        //List<Colleagues__c> collList =  [SELECT id,Name,Pending_amount__c,email__c FROM Colleagues__c WHERE Pending_amount__c>0];
                                    
                                    String[] toAddresses ;
                                    List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
                                       for(integer i = 0;i<scope.size();i++)
                                  { 
                                       toAddresses = new String[]{};
                                      Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                                        toAddresses.add(scope[i].email__c);
                                         System.debug(toAddresses);
                                            
                                    //String[] ccAddresses = new String[] {'smith@gmail.com'};
                                    
                                    
                                    // Assign the addresses for the To and CC lists to the mail object.
  
                                    email.setToAddresses(toAddresses);
    
                                    email.setSubject('Pending amount of '+ scope[i].Pending_amount__c);
                                    email.setHtmlBody('Hi '+ scope[i].Name + '</br></br> You have to give ' + scope[i].Pending_amount__c +' to Karthik regarding the future bday/fairwell celebrations.On anyone\'s  bday/fairwell ,you will get the balance amount mail from your deposit. You can give me cash or Google Pay me @9892636537 .My UPI id is <b>karthikshettyan@okaxis</b>' );
                                 
                                    emailList.add(email);
                                  }
                              Messaging.sendEmail(emailList);
    }
  
    global void finish(Database.BatchableContext BC) {
      System.debug('**************JOB IS FINISHED');
    }
  
}