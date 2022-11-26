public with sharing class CurrencyAPIScheduler implements Schedulable {

    public void execute(SchedulableContext ctx) {

        System.enqueueJob(new CurrencyAPIService());
    }
}


