package com.techelevator.controller;

import com.techelevator.dao.AreaCommentDAO;
import com.techelevator.model.AreaComment;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class CommentsController {

    private AreaCommentDAO areaCommentDAO;

    public CommentsController(AreaCommentDAO areaCommentDAO) { this.areaCommentDAO = areaCommentDAO; }

    @RequestMapping(path="/areas/{name}/comments", method = RequestMethod.GET)
    public List<AreaComment> getAreaCommentsByAreaName(@PathVariable String name) { return areaCommentDAO.getAreaCommentsByAreaName(name); }
}
