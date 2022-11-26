public with sharing class OpportunityTriggerHandler extends TriggerHandler {
    
    public static void beforeUpdate() {
        for (Opportunity opportunity : (List <Opportunity>)Trigger.new) {
        
                               if (opportunity.Amount < 1000 ) {
                        opportunity.FinancialType__c = 'Low';
                     } 
                     if (opportunity.Amount >= 1000 && opportunity.Amount <=10000) {
                        opportunity.FinancialType__c = 'Middle';
                     } 
                     if (opportunity.Amount > 10000) {
                        opportunity.FinancialType__c = 'Extra';
                     }
                   
        }
    }
}
