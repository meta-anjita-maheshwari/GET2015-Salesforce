<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Birthday_After_Two_Days</fullName>
        <description>Birthday After Two Days</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Birthday_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Experience_Exceeded_Five_Years</fullName>
        <description>Experience Exceeded Five Years</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Experience_Is_More_Than_5</template>
    </alerts>
    <rules>
        <fullName>Birthday Reminder</fullName>
        <actions>
            <name>Birthday_After_Two_Days</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND( !ISBLANK( Birthdate ),  !ISBLANK( Email )  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Contact.Birthdate</offsetFromField>
            <timeLength>-2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Experience Is More Than 5</fullName>
        <actions>
            <name>Experience_Exceeded_Five_Years</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>Experience__c  &gt; 5</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
