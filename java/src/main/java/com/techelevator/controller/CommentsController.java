package com.techelevator.controller;

import com.techelevator.dao.AreaCommentDAO;
import com.techelevator.dao.CragCommentDao;
import com.techelevator.dao.RouteCommentDao;
import com.techelevator.model.AreaComment;
import com.techelevator.model.CragComment;
import com.techelevator.model.RouteComment;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class CommentsController {

    private AreaCommentDAO areaCommentDAO;
    private CragCommentDao cragCommentDao;
    private RouteCommentDao routeCommentDao;

    public CommentsController(AreaCommentDAO areaCommentDAO, CragCommentDao cragCommentDao, RouteCommentDao routeCommentDao) {
        this.areaCommentDAO = areaCommentDAO;
        this.cragCommentDao = cragCommentDao;
        this.routeCommentDao = routeCommentDao;
    }

    @RequestMapping(path = "/areas/{name}/comments", method = RequestMethod.GET)
    public List<AreaComment> getAreaCommentsByAreaName(@PathVariable String name) {
        return areaCommentDAO.getAreaCommentsByAreaName(name);
    }

    @RequestMapping(path = "/areas/{name}/comments", method = RequestMethod.POST)
    public AreaComment addAreaComment(@RequestBody AreaComment areaComment) {
        return areaCommentDAO.addAreaComment(areaComment);
    }

    @RequestMapping(path = "/crags/{name}/comments", method = RequestMethod.GET)
    public List<CragComment> getCragCommentsByCragName(@PathVariable String name) {
        return cragCommentDao.getCragCommentsByCragName(name);
    }

    @RequestMapping(path = "/crags/{name}/comments", method = RequestMethod.POST)
    public CragComment addCragComment(@RequestBody CragComment cragComment) {
        return cragCommentDao.addCragComment(cragComment);
    }

    @RequestMapping(path = "/routes/{name}/comments", method = RequestMethod.GET)
    public List<RouteComment> getRouteCommentsByRouteName(@PathVariable String name) {
        return routeCommentDao.getRouteCommentsByRouteName(name);
    }

    @RequestMapping(path = "/routes/{name}/comments", method = Re)

}
