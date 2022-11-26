public with sharing class LeadTriggerHandler {
   public static Boolean isExecuted = false;

        public static void afterUpdate(List <Lead> newLeads, Map <Id, Lead> oldMap){
            List <Lead> leadsToUpdate = new List <Lead>();
            

            for (Lead lead : newLeads) {
                if(lead.Description != oldMap.get(lead.Id).Description) {
                    Lead l = new Lead (Id = lead.Id);
                    l.Description = lead.Description + ' 1 '; 
                    leadsToUpdate.add(l);
                }
            } 
            isExecuted = true;
            update leadsToUpdate;
        }
    
}