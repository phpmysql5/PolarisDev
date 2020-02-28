public with sharing class EmailManager {
    public  static void sendMail(String []addresses,string []subjects, string[] body)
    {
        Messaging.SingleEmailMessage[] mails = new Messaging.SingleEmailMessage[]{};
            
            integer totalmails = addresses.size();
        
        for(integer i = 0 ;i<totalmails;i++)
        {    
             Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
         	 mail.setToAddresses(new List<String> {addresses[i]});
        	 mail.setSubject(subjects[i]);
             mail.setPlainTextBody(body[i]);
             mails.add(mail);
        }
        if(mails.size()>0)
        {
            Messaging.sendEmail(mails);
        }
       
    }

}