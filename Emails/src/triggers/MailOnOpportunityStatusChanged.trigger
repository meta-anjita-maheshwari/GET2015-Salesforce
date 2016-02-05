/*
 * Name : MailOnOpportunityStatusChanged
 * Author : Anjita
 * Created Date : 01/02/2016
 * Usage : Trigger will send a mail to Opportunity owner whenever Opportunity status changes.
 */ 
trigger MailOnOpportunityStatusChanged on Opportunity (after update) {

    Id templateId = [Select id from EmailTemplate where name = 'Opportunity Status Changed'].Id;
    
    for (Opportunity opportunity1 : Trigger.New) {
        opportunity oldOpportunity = trigger.oldmap.get(opportunity1.Id);
        
        if (oldOpportunity.StageName != opportunity1.StageName) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            mail.setTargetObjectId('0032800000CnGqb');
            mail.setTemplateId(templateId);
            mail.setSaveAsActivity(false);
            mail.setWhatId(opportunity1.Id);
            Messaging.SendEmailResult[] result = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        }
    }
}