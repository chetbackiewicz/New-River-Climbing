package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Area {
    @JsonProperty("area_id")
    private int areaId;
    @JsonProperty("area_name")
    private String areaName;
    private String description;
    private String directions;

    public Area() {

    }

    public Area(String areaName, String description, String directions) {
        this.areaName = areaName;
        this.description = description;
        this.directions = directions;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public int getAreaId() {
        return areaId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDirections() {
        return directions;
    }

    public void setDirections(String directions) {
        this.directions = directions;
    }
}
