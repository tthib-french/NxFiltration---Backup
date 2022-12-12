global class BatchUpdateOpportunities implements Database.Batchable<Sobject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT ID, NAME FROM Opportunity where Quota_Match__c = false and requested_delivery_date__c >= 2022-01-01');
    }
    global void execute(Database.BatchableContext bc,List<Opportunity> opps){

    update opps;
    }
    public void finish(Database.BatchableContext bc){
         
    }
}