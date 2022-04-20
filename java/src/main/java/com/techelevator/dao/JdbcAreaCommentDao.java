package com.techelevator.dao;

import com.techelevator.model.Area;
import com.techelevator.model.AreaComment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcAreaCommentDao implements AreaCommentDAO {

    private JdbcTemplate jdbcTemplate;

    public JdbcAreaCommentDao(JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }

    @Override
    public List<AreaComment> getAreaCommentsByAreaName(String areaName) {
        List<AreaComment> areaComments = new ArrayList<>();
        String sql = "SELECT area_comment_id, area_comments.area_id, area_comments.username, comment FROM area_comments " +
                "INNER JOIN areas ON areas.area_id = area_comments.area_id " +
                "WHERE areas.area_name = ?";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, areaName);
        while (rows.next()) {
            areaComments.add(mapRowToAreaComment(rows));
        }
        return areaComments;
    }

    @Override
    public AreaComment addAreaComment(AreaComment areaComment) {
        String sql = "INSERT INTO area_comments(area_id, username, comment) VALUES (?, ?, ?) RETURNING area_comment_id";
        Integer areaCommentId = jdbcTemplate.queryForObject(sql, Integer.class, areaComment.getAreaId(), areaComment.getUsername(), areaComment.getComment());
        areaComment.setAreaCommentId(areaCommentId);
        return areaComment;
    }

    private AreaComment mapRowToAreaComment(SqlRowSet rows) {
        AreaComment areaComment = new AreaComment();
        areaComment.setAreaCommentId(rows.getInt("area_comment_id"));
        areaComment.setUsername(rows.getString("username"));
        areaComment.setAreaId(rows.getInt("area_id"));
        areaComment.setComment(rows.getString("comment"));
        return areaComment;
    }
}
