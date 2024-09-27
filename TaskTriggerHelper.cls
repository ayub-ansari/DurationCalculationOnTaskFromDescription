//Test Class: TaskTriggerTest
public class TaskTriggerHelper {
    
    public static void beforeInsert(List<Task> triggerNew) {
        for (Task t : triggerNew) {
            if (t.Description != null) {
                // Call the helper method to calculate the duration from the description
                t.CallDurationInSeconds = calculateDuration(t.Description);
            }
        }
    }
    
    public static void beforeUpdate(List<Task> triggerNew, Map<Id, Task> triggerOldMap) {
        for (Task t : triggerNew) {
            if (t.Description != triggerOldMap.get(t.Id).Description) {
                //Call the helper method to calculate the duration from the description
                t.CallDurationInSeconds = calculateDuration(t.Description);
            }
        }
    }
    
    public static Integer calculateDuration(String description) {
        Integer totalDuration = 0;
        
        String timeString = description.substringafter('Call duration:');
        
        //Define the regular expression pattern to match hours, minutes, and seconds
        Pattern timePattern = Pattern.compile('(?:\\s*(\\d+)\\s*h)?(?:\\s*(\\d+)\\s*m)?(?:\\s*(\\d+)\\s*s)?');
        Matcher matcher = timePattern.matcher(timeString);
        
        // Check if the pattern matches
        if (matcher.find()) {
            // Extract hours (group 1)
            if (matcher.group(1) != null) {
                totalDuration += Integer.valueOf(matcher.group(1))*360;  
            }
            // Extract minutes (group 2, optional)
            if (matcher.group(2) != null) {
                totalDuration += Integer.valueOf(matcher.group(2))*60;
            }
            // Extract seconds (group 3, optional)
            if (matcher.group(3) != null) {
                totalDuration += Integer.valueOf(matcher.group(3));
            }
        }
        
        // Add up all the hours found (convert to minutes)
       
        return totalDuration;  // Return the total duration in minutes
    }
}