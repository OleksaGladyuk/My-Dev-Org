public with sharing class ContactTriggerHandler extends TriggerHandler {
 
    public override void beforeUpdate() {
        for(Contact c : (List<Contact>) Trigger.new) {
          // do something
        }
      }

      public override void beforeInsert() {
        doSmth();
        for(Contact c : (List<Contact>) Trigger.new) {
          // do something
        }
      }

      public void doSmth() {
        System.debug('it works');
      }
}
