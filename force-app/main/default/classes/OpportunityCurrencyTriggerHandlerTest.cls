@isTest
public class OpportunityCurrencyTriggerHandlerTest {
    
    @testSetup
    static void setup() {
        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
for (Integer i = 0; i < 10; i++) {
        Opportunity opportunity = new Opportunity(
                Name = 'Test Opportunity' + i,
                StageName = 'Prospecting',
                CloseDate = Date.today(),
                Amount = 100
            );
            opportunitiesToUpdate.add(opportunity);
}
        
        insert opportunitiesToUpdate;

        CurrencyAPI__c cs = new CurrencyAPI__c();
        cs.Name = 'test';
        cs.Currency_UAH__c = 38;
        cs.Currency_USD__c = 2;
        cs.Currency_GBP__c = 1.5;
        insert cs;

        
        
    }

    static testmethod void testQueueable() {

    CurrencyAPI__c custS = CurrencyAPI__c.getOrgDefaults();

    List<Opportunity> insertedOpportunity = [
        SELECT Id, Name, Amount, Amount_UAH__c, Amount_USD__c, Amount_GBP__c  
        FROM Opportunity 
        WHERE Name = 'Test Opportunity%'
        LIMIT 10];

        for (Opportunity opp : insertedOpportunity) {
        opp.Amount_UAH__c = opp.Amount * custS.Currency_UAH__c;
        opp.Amount_USD__c = opp.Amount * custS.Currency_USD__c;
        opp.Amount_GBP__c = opp.Amount * custS.Currency_GBP__c;
        }
        update insertedOpportunity;

    List<Opportunity> updatedOpportunity = [ 
        SELECT Id, Name, Amount, Amount_UAH__c, Amount_USD__c, Amount_GBP__c  
        FROM Opportunity 
        WHERE Name = 'Test Opportunity%' 
        LIMIT 1];
        
    }
}
