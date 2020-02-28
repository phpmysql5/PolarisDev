public class Script_8 
{
    public Static void getUserDetails()
    {
	User currentUser = new User();
	currentUser = [SELECT Phone,name,email FROM User WHERE Id =: UserInfo.getUserId()];
	System.debug(currentUser.Phone);
	System.debug(currentUser.name);
 	System.debug(currentUser.email);   
    }
   
}