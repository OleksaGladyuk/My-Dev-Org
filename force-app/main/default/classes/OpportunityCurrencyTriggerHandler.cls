public with sharing class OpportunityCurrencyTriggerHandler {

    public static void updateOpportunityAmount(List<Opportunity> opportunities, Map<Id, Opportunity> oldOpportunityMap) {

        System.debug('opportunities: ' + opportunities);
        System.debug('oldOpportunityMap: ' + oldOpportunityMap);

        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
        

        for (Opportunity opp : opportunities ) {
            Opportunity opportunityOld =(Opportunity)oldOpportunityMap.get(opp.Id);
            if(opp.Amount > 0 && opp.Amount != null && opp.Amount != opportunityOld.Amount){
                opportunitiesToUpdate.add(opp);
                
            }
         }
         
         if(opportunitiesToUpdate.size() > 0){
            System.debug('opportunitiesToUpdate: ' + opportunitiesToUpdate);
            updateOpportunityRates(opportunitiesToUpdate);
           }
         
    }

    public static void updateOpportunityRates(List<Opportunity> opportunities){

        System.debug('opportunities: ' + opportunities);
      CurrencyAPI__c customSettingsApi = CurrencyAPI__c.getOrgDefaults();

      System.debug('customSettingsApi: ' + customSettingsApi);

      for(Opportunity opportunity : opportunities){

          opportunity.Amount_UAH__c = opportunity.Amount*customSettingsApi.Currency_UAH__c;
          opportunity.Amount_USD__c = opportunity.Amount*customSettingsApi.Currency_USD__c;
          opportunity.Amount_GBP__c = opportunity.Amount*customSettingsApi.Currency_GBP__c;
        }

    }
}
