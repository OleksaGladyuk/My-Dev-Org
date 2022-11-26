@isTest
public with sharing class SetDebtsOnContactBatchTest {
    
    static testmethod void testBatch(){

        Contact c = new Contact();

        c.LastName = 'TestContact';
        c.Debt__c = 100;
        c.Fine__c = 2;
        c.Start_Date_Of_Borrow__c = Date.today() + 1;
        insert c;

        System.Test.StartTest();

        SetDebtsOnContactBatch testBatch = new SetDebtsOnContactBatch();
        
        Id jobid= Database.executeBatch(testBatch,5);

        System.Test.StopTest();

        Contact contact = [SELECT Id, LastName, Debt__c, Fine__c, Start_Date_Of_Borrow__c FROM Contact WHERE id=:c.Id];
        system.assertEquals(102, contact.Debt__c);
    }

}

