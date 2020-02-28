public class RandomContactFactory {

    public static  List<Contact> generateRandomContacts(integer num ,string str)
    {
       list <contact> con = new  list <contact>() ;
       
        for(integer i = 0;i<num;i++)
        {
            con.add(new Contact(fIRSTNAME=str+i));
        }
        

      
        
 return con;
        }

          
        
    
}