package com.techelevator.dao;

import com.techelevator.model.Area;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcAreaDao implements AreaDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcAreaDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Area> getAllAreas() {
        List<Area> areaList = new ArrayList<>();
        String sql = "SELECT area_id, name, description, directions FROM areas ORDER BY name";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);
        while (rows.next()) {
            Area area = mapRowToArea(rows);
            areaList.add(area);
        }
        return areaList;
    }

    @Override
    public Area getAreaByName(String name) {
        Area area = new Area();
        String sql = "SELECT area_id, name, description, directions FROM areas WHERE name = ?";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, name);
        if (rows.next()) {
            area = mapRowToArea(rows);
        }
        return area;
    }

    private Area mapRowToArea(SqlRowSet rows) {
        Area area = new Area();
        area.setAreaId(rows.getInt("area_id"));
        area.setAreaName(rows.getString("name"));
        area.setDescription(rows.getString("description"));
        area.setDirections(rows.getString("directions"));
        return area;
    }
}

