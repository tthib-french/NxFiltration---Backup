@IsTest
public class TestUpdateBatches {

    @TestSetup
    static void setup() {
        Account testAccount = new Account();
        testAccount.Name = 'Test Account';
        testAccount.Type = 'End Users';

        insert testAccount;

        Opportunity testOpportunity = new Opportunity();
        testOpportunity.AccountId = testAccount.Id;
        testOpportunity.StageName = 'Negotiation';
        testOpportunity.CloseDate = Date.valueOf(DateTime.now());
        testOpportunity.PMC_Global_Opp__c = 'Other';
        testOpportunity.Name = 'Test Opportunitysa';
        testOpportunity.StageName = 'Closed Lost';

        insert testOpportunity;

        Order testOrder = new Order();
        testOrder.AccountId = testAccount.Id;
        testOrder.EffectiveDate = Date.valueOf(DateTime.now());
        testOrder.Status = 'Draft';

        insert testOrder;
    }

    @isTest
    private static void testUpdateOrdersBatch() {
        Test.startTest();

        BatchUpdateOpportunities batchUpdateOpportunities = new BatchUpdateOpportunities();
        Id batchId = Database.executeBatch(batchUpdateOpportunities, 1);        
        Test.stopTest();
        List<Opportunity> opportunity = [SELECT ID, Name, LastModifiedDate FROM Opportunity LIMIT 1];
        // after the testing stops, assert records were updated properly
        System.assertEquals(Date.valueOf(DateTime.now()), Date.valueOf(opportunity[0].lastModifiedDate));
        System.assertEquals(DateTime.now().minute(), opportunity[0].lastModifiedDate.minute());
    }

    @isTest
    private static void testUpdateOpportunitiesBatch() {
        Test.startTest();

        BatchUpdateOrders batchUpdateOrders  = new BatchUpdateOrders();
        Id batchId = Database.executeBatch(batchUpdateOrders, 1);        
        Test.stopTest();
        List<Order> order= [SELECT ID, Name, LastModifiedDate FROM Order LIMIT 1];
        // after the testing stops, assert records were updated properly
        System.assertEquals(Date.valueOf(DateTime.now()), Date.valueOf(order[0].lastModifiedDate));
        System.assertEquals(DateTime.now().minute(), order[0].lastModifiedDate.minute());
    }
}