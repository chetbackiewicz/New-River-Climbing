package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CragComment {

    @JsonProperty("crag_comment_id")
    private int cragCommentId;
    @JsonProperty("crag_id")
    private int cragId;
    private String comment;

    public CragComment() {
    }

    public CragComment (int cragId, String comment) {
        this.cragId = cragId;
        this.comment = comment;
    }

    public int getCragCommentId() {
        return cragCommentId;
    }

    public void setCragCommentId(int cragCommentId) {
        this.cragCommentId = cragCommentId;
    }

    public int getCragId() {
        return cragId;
    }

    public void setCragId(int cragId) {
        this.cragId = cragId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
