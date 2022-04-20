package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AreaComment {
    @JsonProperty("area_comment_id")
    private int areaCommentId;
    @JsonProperty("area_id")
    private int areaId;
    private String username;
    private String comment;

    public AreaComment() {
    }

    public AreaComment (int areaId, String comment, String username) {
        this.areaId = areaId;
        this.comment = comment;
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getAreaCommentId() {
        return areaCommentId;
    }

    public void setAreaCommentId(int areaCommentId) {
        this.areaCommentId = areaCommentId;
    }

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
