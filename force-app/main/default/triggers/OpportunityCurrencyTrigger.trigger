trigger OpportunityCurrencyTrigger on Opportunity (before update, after update) {

    if (Trigger.isBefore && Trigger.isUpdate) {
        OpportunityCurrencyTriggerHandler.updateOpportunityAmount(Trigger.new, Trigger.oldMap);   
    }

}