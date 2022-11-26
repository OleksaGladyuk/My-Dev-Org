trigger AccountTriger on Account (after update) {
  
    if (Trigger.isAfter && Trigger.isUpdate) {
        AccountTriggerHandler.afterUpdate();
    }
      
 } 
       
    
        
    
