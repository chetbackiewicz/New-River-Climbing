package com.techelevator.controller;

import com.techelevator.dao.RouteDao;
import com.techelevator.model.Route;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class RouteController {

    private RouteDao routeDao;

    public RouteController(RouteDao routeDao) {
        this.routeDao = routeDao;
    }

    @RequestMapping(path="/areas/{areaName}/crags/{cragName}/routes", method = RequestMethod.GET)
    public List<Route> getRoutesByCrag(@PathVariable String areaName, @PathVariable String cragName) {
        return routeDao.getRoutesByCragName(cragName);
    }

//    @RequestMapping(path="/areas/{areaName}/crags/{cragName}/routes/{routeName}", method = RequestMethod.GET)
//    public Route getRouteByName(@PathVariable String areaName, @PathVariable String cragName, @PathVariable String routeName) {
//        return routeDao.getRouteByName(routeName);
//    }

    @RequestMapping(path="/routes/{routeName}", method = RequestMethod.GET)
    public Route getRouteByName(@PathVariable String routeName) {
        return routeDao.getRouteByName(routeName);
    }

    @RequestMapping(path = "/search", method = RequestMethod.GET)
    public List<Route> getAllRoutes() {
        return routeDao.getAllRoutes();
    }
}
