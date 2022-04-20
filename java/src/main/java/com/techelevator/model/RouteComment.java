package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class RouteComment {
    @JsonProperty("route_comment_id")
    private int routeCommentId;
    @JsonProperty("route_id")
    private int routeId;
    private String username;
    private String comment;

    public RouteComment() {}

    public RouteComment (int routeId, String comment, String username) {
        this.routeId = routeId;
        this.comment = comment;
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getRouteCommentId() {
        return routeCommentId;
    }

    public void setRouteCommentId(int routeCommentId) {
        this.routeCommentId = routeCommentId;
    }

    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
