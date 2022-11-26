trigger OpporunityTrigger on Opportunity (before update) {
    /* Trigger.new - Collection of records that update/create, with new fields values.
        Trigger.old - Collection of records that update/create, with old fields values.
        Trigger.newMap - Map where key is record ID, value - record, with new fields values.
        Trigger.oldMap - Map where key is record ID, value - record, with old fields values.
        *Home work* - Add Middle FinancialType that is from 1000 to 10000, and change Extra FinancialType values from 1000 to > 10000.
    */ 
    if(Trigger.isBefore && Trigger.isUpdate) {
        OpportunityTriggerHandler.beforeUpdate();
    }
}
