public with sharing class AccountTriggerHandler  {
    
    public static void afterUpdate() {

        List <Account> accs = Trigger.new;
        Map<Id,List <Contact>> contactByAccountId = new Map<Id,List <Contact>>();
        List <Contact> contactsToUpdate = new List <Contact>();
    
        List <Contact> contacts =  [
            SELECT Id, AccountId, CEO__c
            FROM Contact
            WHERE AccountId IN :  accs
        ];
    
        for(Contact contact : contacts){
            List<Contact> conList;
            if(contactByAccountId.containsKey(contact.AccountId)){
                conList = contactByAccountId.get(contact.AccountId);
            } else {
                conList = new List<Contact>();
            }
            conList.add(contact);
            contactByAccountId.put(contact.AccountId, conList);
        }

        for(Account account : accs) {

            List <Contact> relatedContacts = contactByAccountId.get(account.Id);
            
            for(Contact contact : relatedContacts){
                contact.CEO__c = account.CEO__c;
            
            } 
            contactsToUpdate.addAll(relatedContacts);
        } 
        update contactsToUpdate;

        }
}
