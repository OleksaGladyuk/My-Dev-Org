@isTest
public with sharing class CurrencyAPISchedulerTest {
    
    @isTest 
 public static void testMethodSchedule(){ 
  Test.startTest(); 
  String cronExp ='0 0 08 ? * * *'; 
  System.schedule('UpdateCurrencyReates', cronExp, new CurrencyAPIScheduler ()); 
  Test.stopTest(); 
 } 
}
