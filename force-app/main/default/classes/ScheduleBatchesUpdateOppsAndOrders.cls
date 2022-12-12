global with sharing class ScheduleBatchesUpdateOppsAndOrders implements Schedulable, Database.AllowsCallouts {

    global void execute(SchedulableContext ctx) {
        BatchUpdateOpportunities opportunityUpdateBatch = new BatchUpdateOpportunities();
        Id opportunityUpdateBatchId = Database.executeBatch(opportunityUpdateBatch, 1);

        BatchUpdateOrders orderUpdateBatch = new BatchUpdateOrders();
        Id orderUpdateBatchId = Database.executeBatch(orderUpdateBatch, 1);
    }
}