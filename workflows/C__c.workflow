<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>ABC Check A</fullName>
        <active>false</active>
        <criteriaItems>
            <field>C__c.Countries__c</field>
            <operation>equals</operation>
            <value>A</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
