public class AddPrimaryContact implements Queueable 
{
    Contact contact = new Contact();
    String state;
    
    public AddPrimaryContact(Contact con ,String State)    
    {
        this.contact = con;
        this.state 	= state;
        
    }
    
    public void execute(QueueableContext context)
    { Contact clonedCon = new Contact();
        List<Account> listAccounts= [Select name from Account where BillingState =:state limit 200];
        List<Contact> conList = new List<Contact>();
        for(Account acc :listAccounts)
        {
            contact.AccountId=acc.id;
            clonedCon = contact.clone(false, false, false, false);
            conList.add(clonedCon);
           	

        }
     insert conList;

        
    }
    
        

}