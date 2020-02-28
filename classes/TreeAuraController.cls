public class TreeAuraController {
     
    @AuraEnabled
    public static List<item> getAccountTree(){
         
        List<item> items = new List<item>();
        List<Account> acctList = new List<Account>();
        //get list of accounts and respective contacts
        acctList = [SELECT Id, Name, (SELECT Id, Name From Contacts) From Account LIMIT 10];
        for(Account acc: acctList){
             
            //get contacts of current account record
            List<item> conitems = new List<item>();
            for(Contact c: acc.Contacts){
                //add contact items
                item conitem = new item(c.Name, String.valueOf(c.Id), false, null);
                conitems.add(conitem);
            }
             
            //add account items
            item accitem = new item(acc.Name, String.valueOf(acc.Id), false, conitems);
            items.add(accitem);
        }
        return items;
    }
     
    //Item Wrapper Class
    public class item{
        @AuraEnabled
        public String label {get; set;}
        @AuraEnabled
        public String name {get; set;}
        @AuraEnabled
        public Boolean expanded {get; set;}
        @AuraEnabled
        public List<item> items {get; set;}
         
        public item(String label, String name, Boolean expanded, List<item> items){
            this.label = label;
            this.name = name;
            this.expanded = expanded;
            this.items = items;
        }
    }
}