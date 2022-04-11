package com.techelevator.dao;

import com.techelevator.model.Area;
import com.techelevator.model.Crag;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcCragDao implements CragDao{

    private JdbcTemplate jdbcTemplate;

    public JdbcCragDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Crag> getAllCrags() {
        return null;
    }

    @Override
    public List<Crag> getCragsByAreaName(String areaName) {
        List<Crag> cragsByArea = new ArrayList<>();
        String sql = "SELECT crags.name, crags.crag_id, crags.description, crags.directions, crags.area_id FROM areas " +
                "JOIN crags ON areas.area_id = crags.area_id " +
                "WHERE areas.name = ?";
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, areaName);
        while (rows.next()) {
            Crag crag = mapRowToCrag(rows);
            cragsByArea.add(crag);
        }
        return cragsByArea;
    }

    private Crag mapRowToCrag(SqlRowSet row) {
        Crag crag = new Crag();
        crag.setCragId(row.getInt("crag_id"));
        crag.setCragName(row.getString("name"));
        crag.setDescription(row.getString("description"));
        crag.setDirections(row.getString("directions"));
        crag.setAreaId(row.getInt("area_id"));
        return crag;

    }


}
