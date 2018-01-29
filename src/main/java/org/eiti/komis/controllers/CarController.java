package org.eiti.komis.controllers;

import org.eiti.komis.dto.CarDto;
import org.eiti.komis.repositories.CarRepository;
import org.eiti.komis.services.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;


@RestController
@RequestMapping("/cars")
public class CarController {
    final static DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Autowired
    CarService carService;

    @RequestMapping(method = RequestMethod.GET)
    ModelAndView cars() {
        ModelAndView modelAndView = new ModelAndView("CarPage");
        modelAndView.addObject("cars", carService.getCars());
        return modelAndView;
    }

//    @RequestMapping("/cars")
//    public String index(Model model) {
//        List<CarDto> cars = (List<CarDto>) carService.getCars();
//        model.addAttribute("cars", cars);
//        return "cars";
//    }

    @RequestMapping(value = "car", method = RequestMethod.POST, consumes = MediaType.ALL_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    ModelAndView addCar(@RequestParam Long id,
                        @RequestParam int vin,
                        @RequestParam int rokProdukcji,
                        @RequestParam String krajPochodzenia,
                        @RequestParam int rokRejestracji,
                        @RequestParam boolean bezwypadkowy) throws Exception {

        ModelAndView modelAndView = new ModelAndView("CarPage");
        try {
            CarDto car = new CarDto();
            car.setId(id);
            car.setVin(vin);
            car.setKrajPochodzenia(krajPochodzenia);
            car.setRokProdukcji(rokProdukcji);
            car.setRokRejestracji(rokRejestracji);
            car = carService.addCar(car);
            modelAndView.addObject("message", "Car added with vin: " + car.getVin());
        }
        catch (Exception ex){
            modelAndView.addObject("message", "Failed to add car: " + ex.getMessage());
        }
        modelAndView.addObject("cars", carService.getCars());
        return modelAndView;
    }

//    @RequestMapping(value = "cars/{model}", method = RequestMethod.GET)
//    public String showCarsByModel(@PathVariable String surname, Model model) {
//        model.addAttribute("search", carService.listCarsbyModel(model));
//        return "cars";
//    }

}

