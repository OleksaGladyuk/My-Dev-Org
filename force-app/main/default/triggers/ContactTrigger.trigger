trigger ContactTrigger on Contact (before insert, after insert, after update, before update) {

    new ContactTriggerHandler().run();

    
}