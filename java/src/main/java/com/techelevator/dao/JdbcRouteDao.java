package com.techelevator.dao;

import com.techelevator.model.Route;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcRouteDao implements RouteDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcRouteDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Route> getRoutesByCragName(String cragName) {
        List<Route> routesByCrags = new ArrayList<>();
        String sql = "SELECT routes.route_id, routes.route_name, routes.description, routes.grade, routes.height, routes.rating, routes.sport_trad, routes.has_anchors, routes.crag_id, routes.bolt_count " +
                "FROM routes " +
                "JOIN crags ON routes.crag_id = crags.crag_id " +
                "WHERE crags.crag_name = ?";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, cragName);

        while(rows.next()) {
            Route route = mapRowToRoute(rows);
            routesByCrags.add(route);
        }

        return routesByCrags;
    }

    @Override
    public Route getRouteByName(String routeName) {
        Route route = new Route();

        String sql = "SELECT route_id, route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count FROM routes WHERE route_name = ?";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, routeName);

        while (rows.next()) {
            route = mapRowToRoute(rows);
        }

        return route;
     }

     @Override
     public List<Route> getAllRoutes() {
        List<Route> allRoutes = new ArrayList<>();
        String sql = "SELECT route_id route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count FROM routes";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);

        while (rows.next()) {
            Route route = mapRowToRoute(rows);
            allRoutes.add(route);
        }

        return allRoutes;
     }

    private Route mapRowToRoute(SqlRowSet row) {
        Route route = new Route();
        route.setRouteId(row.getInt("route_id"));
        route.setRouteName(row.getString("route_name"));
        route.setDescription(row.getString("description"));
        route.setGrade(row.getString("grade"));
        route.setHeight(row.getInt("height"));
        route.setRating(row.getInt("rating"));
        route.setSportTrad(row.getString("sport_trad"));
        route.setHasAnchors(row.getBoolean("has_anchors"));
        route.setCragId(row.getInt("crag_id"));
        route.setBoltCount(row.getInt("bolt_count"));

        return route;
    }

}
