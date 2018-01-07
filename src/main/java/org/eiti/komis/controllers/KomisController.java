package org.eiti.komis.controllers;


import org.eiti.komis.dto.CarDto;
import org.eiti.komis.services.KomisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KomisController {

    @Autowired
    KomisService service;

    @RequestMapping("/")
    public String index() {

        Iterable<CarDto> all = service.getAllCars();
        return "witam swiat";
    }
}
