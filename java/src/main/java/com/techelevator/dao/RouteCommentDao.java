package com.techelevator.dao;

import com.techelevator.model.RouteComment;

import java.util.List;

public interface RouteCommentDao {
    List<RouteComment> getRouteCommentsByRouteName(String routeName);
    RouteComment addRouteComment(RouteComment routeComment);
}
