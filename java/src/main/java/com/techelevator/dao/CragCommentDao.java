package com.techelevator.dao;

import com.techelevator.model.CragComment;

import java.util.List;

public interface CragCommentDao {

    List<CragComment> getCragCommentsByCragName(String cragName);
    CragComment addCragComment(CragComment cragComment);
}
