package com.techelevator.dao;

import com.techelevator.model.AreaComment;
import com.techelevator.model.RouteComment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcRouteCommentDao implements RouteCommentDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcRouteCommentDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<RouteComment> getRouteCommentsByRouteName(String routeName) {
        List<RouteComment> routeComments = new ArrayList<>();
        String sql = "SELECT route_comment_id, route_comments.route_id, comment FROM route_comments " +
                "INNER JOIN routes ON routes.route_id = route_comments.route_id " +
                "WHERE routes.route_name = ?";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, routeName);
        if (rows.next()) {
            routeComments.add(mapRowToRouteComment(rows));
        }
        return routeComments;
    }

    @Override
    public RouteComment addRouteComment(RouteComment routeComment) {
        String sql = "INSERT INTO route_comments(route_id, comment) VALUES (?, ?) RETURNING route_comment_id";
        Integer routeCommentId = jdbcTemplate.queryForObject(sql, Integer.class, routeComment.getRouteId(), routeComment.getComment());
        routeComment.setRouteCommentId(routeCommentId);
        return routeComment;
    }

    private RouteComment mapRowToRouteComment(SqlRowSet rows) {
        RouteComment routeComment = new RouteComment();
        routeComment.setRouteCommentId(rows.getInt("route_comment_id"));
        routeComment.setRouteId(rows.getInt("route_id"));
        routeComment.setComment(rows.getString("comment"));
        return routeComment;
    }
}
