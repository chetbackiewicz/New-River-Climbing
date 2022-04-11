package com.techelevator.dao;

import com.techelevator.model.Crag;

import java.util.List;

public interface CragDao {
    List<Crag> getAllCrags();
    List<Crag> getCragsByAreaName(String areaName);
}
