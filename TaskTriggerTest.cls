@isTest
public class TaskTriggerTest {

    @isTest
    static void testCalculateDurationMinutes() {
        // Test case with only minutes
        Task t = new Task(
            Subject = 'Test Task with Minutes',
            Description = 'SDR (305) 930-8787 Call duration:3h 15s'
        );
        insert t;
        
        t.Description = 'SDR (305) 930-8787 Call duration:3h 45m 15s';
        update t;
    }
}