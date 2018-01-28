package org.eiti.komis.controllers;


import org.eiti.komis.dto.CarDto;
import org.eiti.komis.dto.CustomerDto;
import org.eiti.komis.services.KomisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.awt.geom.CubicCurve2D;
import java.util.ArrayList;

@RestController
public class KomisController {

//    @Autowired
//    KomisService service;
//
//    @RequestMapping("/")
//    public String index() {
//
//        Iterable<CarDto> all = service.getAllCars();
//        return "witam swiat";
//    }
//
//    @RequestMapping(value = "/showTableWithValues", method = RequestMethod.GET)
//    public String showTableWithValues(Model model)
//    {
//        //list with Persons
//        ArrayList<CarDto> carList=
//                new ArrayList<CarDto>();
//
//        //carList=  this.getListOfCars();
//
//        model.addAttribute("list", carList);
//
//        return "showTableWithValues";
//    }
}
