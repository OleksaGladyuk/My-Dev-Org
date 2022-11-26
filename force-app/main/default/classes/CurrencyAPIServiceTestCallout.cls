@isTest
public with sharing class CurrencyAPIServiceTestCallout {

    @TestSetup
    static void makeData(){
        CurrencyAPI__c rates = new CurrencyAPI__c();
        insert rates;
        
    }
    
    public static testmethod void testQueueable() {
        Test.setMock(HttpCalloutMock.class, new CurrencyAPIServiceCalloutMock());
        CurrencyAPIService cs = new CurrencyAPIService();
        Test.startTest();
        system.enqueueJob(cs);
        Test.stopTest();

        CurrencyAPI__c rates = [SELECT Id, Currency_GBP__c, Currency_UAH__c, Currency_USD__c FROM CurrencyAPI__c LIMIT 1];

        System.assertEquals(0.861551, rates.Currency_GBP__c);
        System.assertEquals(36.49 , rates.Currency_UAH__c);
        System.assertEquals(0.98 , rates.Currency_USD__c);

   
        
    }
}