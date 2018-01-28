package org.eiti.komis.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ContactController {

    @RequestMapping("/contact")
    public ModelAndView contact() {
        ModelAndView modelAndView = new ModelAndView("Contact");
        return modelAndView;
    }
}
