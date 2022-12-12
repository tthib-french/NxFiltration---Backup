global class ScheduleInstances implements Schedulable, Database.AllowsCallouts {

    global void execute(SchedulableContext ctx) {
        futureCallout();
    }

    @future(callout = true)
    public static void futureCallout(){
        List<String> objectTypes = new List<String>();
        objectTypes.add('Product2');
        oc_eol.ExactOnlineController.sync(objectTypes);
    }
}