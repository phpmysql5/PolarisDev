public class Script2 
{
    
    public Static List<CONTACT> insert10Contacts()
    {    
        
        List<CONTACT> listOfContacts = new List<CONTACT>();
        Account first =new Account();
        for (Integer i =10;i<20;i++)
        {first = new Account(name ='Karthik first '+ i  );
         
         Contact c = new Contact(lastname='karthik '+i);
            c.AccountId=first.Id; 

            listOfContacts.add(c);
           
            
        }
        insert first;
        insert listOfContacts;
        return listOfContacts;
        
        
        
        
        
    }
}