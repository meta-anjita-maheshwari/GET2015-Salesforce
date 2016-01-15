<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Successfully_updated_student_s_record</fullName>
        <description>Successfully updated student&apos;s record</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Update_Student</template>
    </alerts>
    <fieldUpdates>
        <fullName>Married_Status</fullName>
        <field>Married__c</field>
        <literalValue>1</literalValue>
        <name>Married Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Married Status Update</fullName>
        <actions>
            <name>Married_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Student__c.Wife_Name__c</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Student1</fullName>
        <actions>
            <name>Successfully_updated_student_s_record</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>CreatedDate  &lt;  LastModifiedDate</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
