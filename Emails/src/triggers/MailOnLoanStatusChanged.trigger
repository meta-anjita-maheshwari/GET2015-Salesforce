/*
 * Name : MailOnLoanStatusChanged
 * Author : Anjita
 * Created Date : 01/02/2016
 * Usage : Trigger will send a mail to Loan owner whenever loan status changes to Approved or Rejected.
 */ 
trigger MailOnLoanStatusChanged on Loan__c (after update) {

    Id templateId = [Select id from EmailTemplate where name = 'Loan Status Changed'].Id;
    
    for (Loan__c loan1 : Trigger.New) {
        Loan__c oldLoan = trigger.oldmap.get(loan1.Id);
        
        if ((oldLoan.Status__c != loan1.Status__c) && ((loan1.Status__c == 'Approved') ||(loan1.Status__c == 'Rejected'))) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
          //  mail.setToAddresses();
            mail.setTargetObjectId('0032800000CnGqb');
            mail.setTemplateId(templateId);
            mail.setSaveAsActivity(false);
            mail.setWhatId(loan1.id);
            
            Messaging.SendEmailResult[] result = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        }
    }
}