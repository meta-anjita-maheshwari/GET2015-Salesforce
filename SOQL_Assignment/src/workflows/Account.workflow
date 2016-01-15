<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Successfully_updated_student_s_record</fullName>
        <description>Successfully updated student&apos;s record</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/account_Information_updated</template>
    </alerts>
    <fieldUpdates>
        <fullName>final_approval</fullName>
        <field>Type</field>
        <literalValue>Customer</literalValue>
        <name>final approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>initial</fullName>
        <field>Type</field>
        <literalValue>Pending</literalValue>
        <name>initial</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>reject</fullName>
        <field>Type</field>
        <literalValue>Prospect</literalValue>
        <name>reject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Notify Account Owner</fullName>
        <actions>
            <name>Successfully_updated_student_s_record</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND((OwnerId &lt;&gt; LastModifiedById), (AnnualRevenue  &gt; 1000000))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
