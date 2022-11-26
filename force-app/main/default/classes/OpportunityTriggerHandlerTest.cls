@isTest
public with sharing class OpportunityTriggerHandlerTest {
    
    @TestSetup
    static void makeData(){
        
       List<Opportunity> oppListTest = new List<Opportunity>();

       Opportunity opp1 = new Opportunity(Name = 'Test1', StageName = 'Prospecting', CloseDate = Date.today(), Amount = 900);
       
       oppListTest.add(opp1);


        Opportunity opp2 = new Opportunity(Name = 'Test2', StageName = 'Prospecting', CloseDate = Date.today(), Amount = 5000);

        oppListTest.add(opp2);


        Opportunity opp3 = new Opportunity(Name = 'Test3', StageName = 'Prospecting', CloseDate = Date.today(), Amount = 15000);

        oppListTest.add(opp3);

        insert oppListTest;

        
    }
    
    @IsTest
    static void setMidLevel(){
        
        Opportunity opp = [
            SELECT id, Name, Amount, FinancialType__c
            FROM Opportunity
            WHERE Amount = 900
            LIMIT 1
        ];

        opp.Amount = 1100;
        update opp;

        Opportunity updatedOpp = [
            SELECT id, Name, Amount, FinancialType__c
            FROM Opportunity
            WHERE Amount = 1100
            LIMIT 1
        ];
       
        System.assertEquals('Middle', updatedOpp.FinancialType__c);

    }
    @isTest
    static void setLowLevel(){

        Opportunity opp2 = [
            SELECT id, Name, Amount, FinancialType__c
            FROM Opportunity
            WHERE Amount = 5000
            LIMIT 1
        ];
        opp2.Amount = 500;
        update opp2;

        Opportunity updatedOpp2 = [
            SELECT id, Name, Amount, FinancialType__c
            FROM Opportunity
            WHERE Amount = 500
            LIMIT 1
        ];

        System.assertEquals('Low', updatedOpp2.FinancialType__c);
    }

    @IsTest
    static void setExtraLevel(){

        Opportunity opp3 = [
            SELECT Id, Name, Amount, FinancialType__c
            FROM Opportunity
            WHERE Amount = 5000
            LIMIT 1
        ];

        opp3.Amount = 11000;
        update opp3;
        
        Opportunity updatedOpp3 = [
            SELECT Id, Name, Amount, FinancialType__c
            FROM Opportunity
            WHERE Amount = 11000
            LIMIT 1
        ];

        System.assertEquals('Extra', updatedOpp3.FinancialType__c);
        
    }
}