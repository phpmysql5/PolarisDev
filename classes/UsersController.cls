public class UsersController {
    
   
    
    @AuraEnabled
    public static List<Colleagues__c> findAll() {
        List<Colleagues__c> colleagueList = [Select Name,email__c,pending_amount__c,paid_amount__c from Colleagues__c ];
        sYSTEM.debug(colleagueList);
        return colleagueList;
        //List<Games__C> mcs = Games__c.getall().values();
    }
    @AuraEnabled
    public static void sendMail2(String[] users,String options,Integer amount,String person,String time2) 
    {   
            System.debug(users.size()+'size');
            System.debug(options);
            System.debug(time2);
         System.debug(amount);
        
            String []split = time2.split(', ');
            String hours = split[1];
            System.debug(hours);

            System.debug(amount);
            System.debug(person);
            //List<Colleague__c> usrList = [Select id,name from user where name in :users ];
            //System.debug(usrList);
            //return usrList;

        Integer divide = 0 ;
        divide  = Integer.valueOf(amount) / users.size();
        System.debug(divide);
       List<Colleagues__c> collList =  [SELECT id,Paid_Amount__c,email__c,Pending_amount__c FROM Colleagues__c WHERE name in: users];
        System.debug(collList);
        
        for(Integer i = 0;i<collList.size();i++)
        {  
       
            collList[i].Pending_amount__c = collList[i].Pending_amount__c+divide;
        }
        Database.Update(collList);
        System.debug(collList);
      //colleagueList = Colleagues__c.getValues(users);
        System.debug(collList);
        //Messaging.reserveSingleEmailCapacity(1001);
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
        // Strings to hold the email addresses to which you are sending the email.
        String[] toAddresses = new String[]{};
        for(integer i = 0;i<users.size();i++)
        {
            toAddresses.add(collList[i].email__c);
                
        //String[] ccAddresses = new String[] {'smith@gmail.com'};
        }  
        
        // Assign the addresses for the To and CC lists to the mail object.
  
        mail.setToAddresses(toAddresses);
      
        
        
        // Specify the address used when the recipients reply to the email.  
        //mail.setReplyTo('support@acme.com');
        
        // Specify the name used as the display name.
        //mail.setSenderDisplayName(colleagueList[i].email__c);
        
        // Specify the subject line for your email address.
        mail.setSubject( options +'of ' + person);
        
        // Set to True if you want to BCC yourself on the email.
        mail.setBccSender(false);
        
        // Optionally append the salesforce.com email signature to the email.
        // The email address of the user executing the Apex Code will be used.
        mail.setUseSignature(false);
        
        // Specify the text content of the email.
        mail.setPlainTextBody('Hi all ');
        
        mail.setHtmlBody('<br/></br>Please be available for '+ options+' celebration of '+ person +' in 4th floor cafeteria  at ' +hours +'<br/></br>Thanks</br>Karthik Shettyan');



            // 'To view your case <a href=https://yourInstance.salesforce.com/'+case.Id+'>click here.</a>');
        
        // Send the email you have created.
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                   
        }
    
    
     @AuraEnabled
    public static boolean updatePayments(List<Colleagues__c> editedAccountList){
        
        try{ 
            List<Colleagues__c> newList = new  List<Colleagues__c>();
            System.debug(editedAccountList);
            update editedAccountList;
            for(Colleagues__c coll :editedAccountList )
            {
                coll.Paid_Amount__c =0;
                newList.add(coll);
            }
             update newList;
            
            return true;
        } catch(Exception e){
            return false;
        }
    }



}