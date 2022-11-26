public with sharing class CurrencyAPIService implements Queueable, Database.AllowsCallouts {


    public void execute(QueueableContext context){
       
      Http http = new Http();
        Httprequest request = new Httprequest();
        Currency_API__mdt currencyApi = [SELECT Id, Endpoint__c, Key__c FROM Currency_API__mdt LIMIT 1];
        String endPointStr = currencyApi.Endpoint__c;
        request.setEndpoint(endPointStr);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('apikey', currencyApi.Key__c);
        request.setTimeout(120000);
        HttpResponse response = http.send(request);

        String body = response.getBody();


        System.debug(body);


        if(response.getStatusCode() == 200){

            Map<String, Object> serverDataByPropertyName = (Map<String, Object>)JSON.deserializeUntyped(body);
            Map<String, Object> rates = (Map<String, Object>)serverDataByPropertyName.get('rates');
            List<String> neededCurrencyValues = new List<String>{'UAH', 'USD', 'GBP'};

            Map <String, Decimal> startRateByCurrencyName = new Map <String, Decimal>();

            CurrencyAPI__c customSettingsApi = CurrencyAPI__c.getOrgDefaults();

            for(String currencyName : neededCurrencyValues) {
                Map<String, Object> currencyFieldByProperty = (Map<String, Object>)rates.get(currencyName);
                Decimal start_rate = (Decimal)currencyFieldByProperty.get('start_rate');
                startRateByCurrencyName.put(currencyName, start_rate);
            }

            if(startRateByCurrencyName.containsKey('UAH')){
                customSettingsApi.Currency_UAH__c = startRateByCurrencyName.get('UAH');
            } 

            if(startRateByCurrencyName.containsKey('USD')){
                customSettingsApi.Currency_USD__c = startRateByCurrencyName.get('USD');
            } 

            if(startRateByCurrencyName.containsKey('GBP')){
                customSettingsApi.Currency_GBP__c = startRateByCurrencyName.get('GBP');
            }

            System.debug('customSettingsApi: ' + customSettingsApi);

            update customSettingsApi;

            System.debug('Currency Rates Fields by Custom Settings: ' + customSettingsApi);
        }                
      }  
    }
     
  




