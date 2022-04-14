package com.techelevator.controller;


import com.techelevator.dao.ActivityLogDao;
import com.techelevator.model.ActivityLog;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class ActivityLogController {

    private ActivityLogDao activityLogDao;

    public ActivityLogController(ActivityLogDao activityLogDao) {
        this.activityLogDao = activityLogDao;
    }

    @RequestMapping(path="/{userId}/activity-log", method = RequestMethod.GET)
    public List<ActivityLog> getActivityLogsByUserId(@PathVariable int userId) {
        return activityLogDao.getActivityLogsByUserId(userId);
    }

    @RequestMapping(path="/{userId}/activity-log", method = RequestMethod.POST)
    public ActivityLog addActivityLog(@RequestBody ActivityLog activityLog) {
        return activityLogDao.addActivityLog(activityLog);
    }
}
