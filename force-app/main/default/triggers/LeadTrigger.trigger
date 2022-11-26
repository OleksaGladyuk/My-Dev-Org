trigger LeadTrigger on Lead (after update) {

    if (Trigger.isAfter && Trigger.isUpdate && LeadTriggerHandler.isExecuted == false) {
        LeadTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);

    }

}