package org.eiti.komis.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CompanyController {

    @RequestMapping("/company")
    public ModelAndView company() {
        ModelAndView modelAndView = new ModelAndView("Company");
        return modelAndView;
    }
}
