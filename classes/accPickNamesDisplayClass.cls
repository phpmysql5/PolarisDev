public with sharing class accPickNamesDisplayClass {
	List<selectOption> options = new List<selectOption>();
	public List<selectOption> getAccNames() {
		for(Capital__c acc : [select Capital_Names__c from Capital__c]) {
			options.add(new selectOption(acc.Capital_Names__c,acc.Capital_Names__c));
		}
		return options;
	}
}