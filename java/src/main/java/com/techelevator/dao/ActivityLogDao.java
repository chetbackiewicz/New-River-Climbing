package com.techelevator.dao;

import com.techelevator.model.ActivityLog;

import java.util.List;

public interface ActivityLogDao {
    List<ActivityLog> getActivityLogsByUserId(int userId);
    ActivityLog addActivityLog(ActivityLog activityLog);
    void deleteActivity(int activityLogId);
}
