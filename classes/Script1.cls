public  Class Script1 
{
    public  Static  List<Account> insert20Accounts()
    {
        List<Account> listOfAccount = new List<Account>();
        for(Integer i =0;i<20;i++)
        {
            Account account = new Account(name ='A '+i,BillingStreet=' '+i ,BillingCity=' '+i,BillingState=' '+i,BillingPostalCode=' '+i,
                                      BillingCountry=' '+i);
            listOfAccount.add(account);
   
        }
        insert listOfAccount;
        return listOfAccount;
    }

}