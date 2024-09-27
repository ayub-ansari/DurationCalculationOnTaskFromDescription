//Test Class: TaskTriggerTest
trigger TaskTrigger on Task (before insert, before update) {
    if(trigger.isInsert) {
        if(trigger.isBefore) {
            TaskTriggerHelper.beforeInsert(trigger.new);
        }
    }else if(trigger.isUpdate) {
        TaskTriggerHelper.beforeUpdate(trigger.new, trigger.oldMap);
    }
     
}