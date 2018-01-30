package org.eiti.komis.controllers;

import org.eiti.komis.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

import org.eiti.komis.dto.CustomerDto;
import org.eiti.komis.repositories.CustomerRepository;

@Controller
public class CustomerController {
	@Autowired
    private CustomerRepository repository;

    
}
