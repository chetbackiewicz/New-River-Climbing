package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Route {
    @JsonProperty("route_id")
    private int routeId;
    @JsonProperty("name")
    private String routeName;
    private String description;
    private String grade;
    private int height;
    private int rating;
    @JsonProperty("sport_trad")
    private String sportTrad;
    @JsonProperty("has_anchors")
    private boolean hasAnchors;
    @JsonProperty("crag_id")
    private int cragId;

    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public String getRouteName() {
        return routeName;
    }

    public void setRouteName(String routeName) {
        this.routeName = routeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getSportTrad() {
        return sportTrad;
    }

    public void setSportTrad(String sportTrad) {
        this.sportTrad = sportTrad;
    }

    public boolean isHasAnchors() {
        return hasAnchors;
    }

    public void setHasAnchors(boolean hasAnchors) {
        this.hasAnchors = hasAnchors;
    }

    public int getCragId() {
        return cragId;
    }

    public void setCragId(int cragId) {
        this.cragId = cragId;
    }
}
