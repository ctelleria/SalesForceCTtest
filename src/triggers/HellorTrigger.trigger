trigger HellorTrigger on Invoice__c (before insert) {
 System.debug('*Hello World!claudia');
}