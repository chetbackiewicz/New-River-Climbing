package com.techelevator.dao;

import com.techelevator.model.Route;

import java.util.List;

public interface RouteDao {

    List<Route> getRoutesByCragName(String cragName);

    Route getRouteByName(String routeName);

}
