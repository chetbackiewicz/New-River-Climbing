package com.techelevator.dao;

import com.techelevator.model.ActivityLog;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcActivityLogDao implements ActivityLogDao{
    private JdbcTemplate jdbcTemplate;

    public JdbcActivityLogDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<ActivityLog> getActivityLogsByUserId(int userId) {
        List<ActivityLog> activityLogs = new ArrayList<>();
        String sql = "select activity_log_id, routes.route_id, area_name, crag_name, route_name, user_id, " +
                "attempts, date_sent, route_comments from activity_logs " +
                "JOIN routes ON activity_logs.route_id = routes.route_id " +
                "JOIN crags ON routes.crag_id = crags.crag_id " +
                "JOIN areas ON areas.area_id = crags.area_id " +
                "WHERE activity_logs.user_id = ?";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, userId);
        while(rows.next()) {
            ActivityLog log = mapRowToActivityLog(rows);
            activityLogs.add(log);
        }
        return activityLogs;
    }

    @Override
    public void addActivityLog(ActivityLog activityLog) {

    }

    private ActivityLog mapRowToActivityLog(SqlRowSet row) {
        ActivityLog log = new ActivityLog();
        log.setLogId(row.getInt("activity_log_id"));
        log.setUserId(row.getInt("user_id"));
        log.setAreaName(row.getString("area_name"));
        log.setCragName(row.getString("crag_name"));
        log.setRouteId(row.getInt("route_id"));
        log.setRouteName(row.getString("route_name"));
        log.setAttempts(row.getInt("attempts"));
        if (row.getDate("date_sent") != null) {
            log.setDateSent(row.getDate("date_sent").toLocalDate());
        }
        log.setComments(row.getString("route_comments"));

        return log;
    }
}
