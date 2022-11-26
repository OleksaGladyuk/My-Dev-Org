public with sharing class SetDebtsOnContactsSchedule implements Schedulable{
    
    public void execute(SchedulableContext ctx){

        //TODO: run Batch

        //TODO: schedule a date

        SetDebtsOnContactBatch instanceOfBatchClass = new SetDebtsOnContactBatch();

        database.executebatch(instanceOfBatchClass, 1000);
    }
}
