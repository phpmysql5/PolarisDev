public class showEmployeeRecords {
    @AuraEnabled
    public static List<Employee2__c> showEmployeeRecords()
    {
        List<Employee2__c> employeeList = [Select AGE__c,Experienced__c,FirstName__c,LastName__c from Employee2__c];
        return employeeList;
        
    }
    @AuraEnabled
    public static Employee2__c showRecentEmployeeRecords(Integer age,Boolean IsExperienced,String LastName,String FirstName)
    {
        Employee2__c employee = new Employee2__c(AGE__c=age,Experienced__c=IsExperienced,LastName__c =LastName,FirstName__c=FirstName);
        insert employee;
        return employee;
        
    }
    
    @AuraEnabled
    public static Employee2__c editTheRecord(Id employeeId)
    {
        Employee2__c employee = [Select AGE__c,Experienced__c,FirstName__c,LastName__c from Employee2__c where Id =: employeeId];
        return employee;
    }
    

}