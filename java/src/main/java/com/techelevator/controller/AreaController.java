package com.techelevator.controller;

import com.techelevator.dao.AreaDao;
import com.techelevator.model.Area;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@CrossOrigin
@RestController
public class AreaController {

    private AreaDao areaDao;

    public AreaController(AreaDao areaDao) {
        this.areaDao = areaDao;
    }

    @RequestMapping(path="/areas", method = RequestMethod.GET)
    public List<Area> getAllAreas() {
        return areaDao.getAllAreas();
    }

    @RequestMapping(path="/areas/{name}", method = RequestMethod.GET)
    public Area getAreaByName(@PathVariable String name) {
        return areaDao.getAreaByName(name);
    }



}
