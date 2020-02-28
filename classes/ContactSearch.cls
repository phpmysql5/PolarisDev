public class ContactSearch {
    public static List<Contact> searchForContacts(String a1,String a2)
    {
       Contact[] con = [Select Id from Contact where LastName=:a1 AND MailingPostalCode=:a2 ];
        return con;
    }

    

}