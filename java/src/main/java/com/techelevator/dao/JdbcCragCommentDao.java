package com.techelevator.dao;

import com.techelevator.model.AreaComment;
import com.techelevator.model.Crag;
import com.techelevator.model.CragComment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcCragCommentDao implements CragCommentDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcCragCommentDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<CragComment> getCragCommentsByCragName(String cragName) {
        List<CragComment> cragComments = new ArrayList<>();
        String sql = "SELECT crag_comment_id, crag_comments.crag_id, crag_comments.username, comment FROM crag_comments " +
                "INNER JOIN crags ON crags.crag_id = crag_comments.crag_id " +
                "WHERE crags.crag_name = ?";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, cragName);
        while (rows.next()) {
            cragComments.add(mapRowToCragComment(rows));
        }
        return cragComments;
    }

    @Override
    public CragComment addCragComment(CragComment cragComment) {
        String sql = "INSERT INTO crag_comments(crag_id, comment, username) VALUES (?, ?, ?) RETURNING crag_comment_id";
        Integer cragCommentId = jdbcTemplate.queryForObject(sql, Integer.class, cragComment.getCragId(), cragComment.getComment(), cragComment.getUsername());
        cragComment.setCragCommentId(cragCommentId);
        return cragComment;
    }


    private CragComment mapRowToCragComment(SqlRowSet rows) {
        CragComment cragComment = new CragComment();
        cragComment.setCragCommentId(rows.getInt("crag_comment_id"));
        cragComment.setCragId(rows.getInt("crag_id"));
        cragComment.setUsername(rows.getString("username"));
        cragComment.setComment(rows.getString("comment"));
        return cragComment;
    }
}
