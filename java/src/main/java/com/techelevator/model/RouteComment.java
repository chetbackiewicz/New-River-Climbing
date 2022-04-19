package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class RouteComment {
    @JsonProperty("route_comment_id")
    private int routeCommentId;
    @JsonProperty("route_id")
    private int routeId;
    private String comment;

    public RouteComment() {}

    public RouteComment (int routeId, String comment) {
        this.routeId = routeId;
        this.comment = comment;
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
