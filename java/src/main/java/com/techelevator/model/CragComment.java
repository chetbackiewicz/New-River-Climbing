package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CragComment {

    @JsonProperty("crag_comment_id")
    private int cragCommentId;
    @JsonProperty("crag_id")
    private int cragId;
    private String username;
    private String comment;

    public CragComment() {
    }

    public CragComment (int cragId, String comment, String username) {
        this.cragId = cragId;
        this.comment = comment;
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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
