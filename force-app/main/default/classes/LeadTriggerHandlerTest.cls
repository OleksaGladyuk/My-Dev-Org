@isTest
public with sharing class LeadTriggerHandlerTest {
    
    @TestSetup
    static void LeadTestMethod(){
        
        Lead lead = new Lead(LastName = 'TestName', Company = 'Salesforce', Description = 'Test');    
        
        insert lead;


       }
       @isTest
       public static void testNewUpdatedLead() {

        Lead lead = [
            SELECT Id, LastName, Description
            FROM Lead
            WHERE LastName = 'TestName'
            LIMIT 1
        ];

        lead.Description = 'Tester';
        update lead;
        
        Lead updatedLead = [
            SELECT Id, LastName, Description
            FROM Lead
            WHERE LastName = 'TestName'
            LIMIT 1
        ];

        System.assertEquals('Tester 1', updatedLead.Description);
        System.debug(updatedLead.Description);

       }
    }

