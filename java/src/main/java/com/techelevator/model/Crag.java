package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Crag {
    @JsonProperty("crag_id")
    private int cragId;
    @JsonProperty("crag_name")
    private String cragName;
    private String description;
    private String directions;
    @JsonProperty("area_id")
    private int areaId;

    public int getCragId() {
        return cragId;
    }

    public void setCragId(int cragId) {
        this.cragId = cragId;
    }

    public String getCragName() {
        return cragName;
    }

    public void setCragName(String cragName) {
        this.cragName = cragName;
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

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }
}
