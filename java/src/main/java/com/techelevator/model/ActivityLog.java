package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDate;

public class ActivityLog {
    @JsonProperty("activity_log_id")
    private int logId;
    @JsonProperty("user_id")
    private int userId;
    @JsonProperty("route_id")
    private int routeId;
    @JsonProperty("route_name")
    private String routeName;
    @JsonProperty("crag_name")
    private String cragName;
    @JsonProperty("area_name")
    private String areaName;
    private int attempts;
    @JsonProperty("date_sent")
    private LocalDate dateSent;
    @JsonProperty("route_comments")
    private String comments;

    public ActivityLog() {

    }

    public ActivityLog(int userId, int routeId, String cragName, String areaName, int attempts, LocalDate dateSent, String comments) {
        this.userId = userId;
        this.routeId = routeId;
        this.attempts = attempts;
        this.dateSent = dateSent;
        this.comments = comments;
        this.cragName = cragName;
        this.areaName = areaName;
    }

    public String getRouteName() {
        return routeName;
    }

    public void setRouteName(String routeName) {
        this.routeName = routeName;
    }

    public int getLogId() {
        return logId;
    }

    public void setLogId(int logId) {
        this.logId = logId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public String getCragName() {
        return cragName;
    }

    public void setCragName(String cragName) {
        this.cragName = cragName;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public int getAttempts() {
        return attempts;
    }

    public void setAttempts(int attempts) {
        this.attempts = attempts;
    }

    public LocalDate getDateSent() {
        return dateSent;
    }

    public void setDateSent(LocalDate dateSent) {
        this.dateSent = dateSent;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }
}
