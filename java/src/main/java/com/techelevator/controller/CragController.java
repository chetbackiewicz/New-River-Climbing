package com.techelevator.controller;

import com.techelevator.dao.CragDao;
import com.techelevator.model.Crag;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class CragController {

    private CragDao cragDao;

    public CragController(CragDao cragDao) {
        this.cragDao = cragDao;
    }

    @RequestMapping(path="/areas/{areaName}/crags", method = RequestMethod.GET)
    public List<Crag> getCragsByArea(@PathVariable String areaName) {
        return cragDao.getCragsByAreaName(areaName);
    }
}
