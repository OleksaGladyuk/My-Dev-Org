public class SetDebtsOnContactBatch implements Database.Batchable<sObject> {

    //TODO: Create new fields on Contact
    // Debt__c (Currency 16, 2)
    // Start_Date_Of_Borrow__c (Date)
    // Fine__c (Persentage 3, 2)

    public Database.QueryLocator start(Database.BatchableContext bc) {

        // collect the batches of records or objects to be passed to execute
        //TODO: SELECT Contacts WHERE: 
        // 1) Debt__c > 0 && Debt__c != null
        // 2) Today is the same day with Start_Date_Of_Borrow__c && Start_Date_Of_Borrow__c != Today

        return Database.getQueryLocator(
            
           ' SELECT Id, Name, Fine__c, Start_Date_Of_Borrow__c, Debt__c ' +
           ' FROM Contact ' +
           ' WHERE Debt__c > 0 ' +
           ' AND Debt__c != null ' +
           ' AND Start_Date_Of_Borrow__c < TODAY ' 
           
        );
        
    }

    public void execute(Database.BatchableContext bc, List<Contact> scope){
        
        // process each batch of records
        // TODO: for each contact set new Debt__c (contact.Debt__c = Debt__c*(1+Fine__c)) !!! percentage to decimal
        // update contacts

        List<Contact> contactsToUpdate = new List<Contact>();

        for (Contact contact : scope) {
            String str = '0 0 12 ?  *  L' ;
            Boolean isContactDebtor = false;
            Date today = Date.today();
            Date contactBorrowDate =  contact.Start_Date_Of_Borrow__c;
            isContactDebtor = today.day() == contactBorrowDate.day();
            
            if(isContactDebtor){

                contact.Debt__c = contact.Debt__c*(1 + (contact.Fine__c/100));
                contactsToUpdate.add(contact);
            }
        }

            update contactsToUpdate;
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        //TODO: leave empty
    }
}