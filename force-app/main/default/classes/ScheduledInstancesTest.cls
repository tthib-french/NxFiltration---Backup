@isTest
class ScheduledInstancesTest {
    @isTest
    private static void testScheduleInstances() {
        Test.startTest();

        Account a = new Account();

        a.Name= 'testAccount';
        insert a;

        String jobId = System.schedule('testScheduleInstance', '0 0 * * * ?', new ScheduleInstances());

        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
        FROM CronTrigger WHERE id = :jobId];

        System.assertEquals('0 0 * * * ?', ct.CronExpression);

        System.assertEquals(0, ct.TimesTriggered);

        System.assertEquals(Datetime.now().format('yyyy-MM-dd')+ ' ' + (Datetime.now().hour() + 1)+':00:00', String.valueOf(ct.NextFireTime));

        System.assertNotEquals('testScheduledApexFromTestMethodUpdated',
         [SELECT Id, Name FROM Account WHERE Id = :a.Id].Name);

        Test.stopTest();

        System.assertEquals('testAccount',
        [SELECT Id, Name FROM Account WHERE Id = :a.Id].Name);

        delete [select Id from Account WHERE Id = :a.Id];
    }

}