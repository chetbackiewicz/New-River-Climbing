package com.techelevator.dao;

import com.techelevator.model.AreaComment;

import java.util.List;

public interface AreaCommentDAO {
    List<AreaComment> getAreaCommentsByAreaName(String areaName);
}
