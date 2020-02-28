trigger AccountAddressTrigger on Account (before insert,before update) {
   
Account[] acc = Trigger.new;
    
    public boolean doesFieldExist(String objName, string fieldName)

    {

   try {

     SObject so = Schema.getGlobalDescribe().get(objName).newSObject();

   return so.getSobjectType().getDescribe().fields.getMap().containsKey(fieldName);

        }

        catch(Exception ex) {}

         

        return false;

    }
    
    
    
    
    
    

    
for (account a:acc)
  {
    if (a.name != null )
        {
            if (a.Match_Billing_Address__c == true &&  doesFieldExist('Account', 'BillingPostalCode'))
            {
                a.ShippingPostalCode=a.BillingPostalCode;
            }
        }
  }

}