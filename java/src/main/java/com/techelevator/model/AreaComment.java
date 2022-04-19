package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AreaComment {
    @JsonProperty("area_comment_id")
    private int areaCommentId;
    @JsonProperty("area_id")
    private int areaId;
    private String comment;

    public AreaComment() {
    }

    public AreaComment (int areaId, String comment) {
        this.areaId = areaId;
        this.comment = comment;
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
