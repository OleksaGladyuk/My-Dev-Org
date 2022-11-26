@isTest
public with sharing class AccountTriggerHandlerTest {
   
    @TestSetup
    static void afterUpdateAccount(){
        Contact c = new Contact();
        c.LastName = 'DemoContact';

        insert c;
             
        Account a = new Account();
        a.Name = 'DemoAccount';
        a.CEO__c = c.Id;
            
        insert a;
    
        Contact con = new Contact();
        con.LastName ='Test';
        con.AccountId = a.Id;

        insert con;
    }

    @IsTest
    static void testUpdatedContactByAccountId(){

        Contact contact = new Contact();
        contact.LastName = 'TestContact';

        insert contact;
        
        Account acc = [
            SELECT Id, Name, CEO__c
            FROM Account
            WHERE Name = 'DemoAccount'
            
        ];
        acc.CEO__c = contact.Id;
        update acc;

        
        Account alreadyUpdatedAcc = [
            SELECT Id, Name, CEO__c
            FROM Account
            WHERE Name = 'DemoAccount'
            LIMIT 1
        ];

       
        
    }
}


