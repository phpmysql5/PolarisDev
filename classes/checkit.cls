public class checkit {
    public static void checkClone()
    {
        List<Checkit__c> checkList = [Select name from checkit__c where id = 'a0U7F000000m0ro'];
        List<checkit__c> clones = new List<checkit__c>();
        for(checkit__c check :checkList)
        {
            checkit__c clonerec = check.clone(false,true);
            clones.add(clonerec);
        }
        
        insert clones;
        System.debug('=========='+clones);
        
    }
    
    public static boolean validateNumber(String numStr) {
    return pattern.compile('(?!000000000)\\d{9}').matcher(numStr).matches();
	
  
} 


}