package com.techelevator.dao;

import com.techelevator.model.Area;

import java.util.List;

public interface AreaDao {
    List<Area> getAllAreas();
    Area getAreaByName(String name);
}
