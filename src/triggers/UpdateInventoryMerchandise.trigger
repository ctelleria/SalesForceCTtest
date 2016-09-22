trigger UpdateInventoryMerchandise on Line_Item__c (after insert, after update) {
    if (Trigger.isInsert){
        system.debug('--- IS insert-claudia ---'+Line_Item__c.name);
    }
    else  {
        if(Trigger.isDelete){
              system.debug('--- IS delete claudi---'+Line_Item__c.name);
        }else{
             system.debug('--- IS update  clau----'+Line_Item__c.name);
        }
    }

}