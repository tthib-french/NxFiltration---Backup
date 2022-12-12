global with sharing class BatchUpdateOrders implements Database.Batchable<Sobject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT ID FROM Order where Quota_Match__c = false and Delivery_Date__c >= 2022-01-01');
    }
    global void execute(Database.BatchableContext bc,List<Order> orders){

    update orders;
    }
    public void finish(Database.BatchableContext bc){
         
    }
}