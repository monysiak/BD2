package org.eiti.komis.controllers;

import org.eiti.komis.dto.OffersForSaleDto;
import org.eiti.komis.services.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;


@RestController
@RequestMapping("/")
public class OfferForSaleController {
    final static DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Autowired
    OfferService offerService;

    @RequestMapping(method = RequestMethod.GET)
    ModelAndView offers() {
        ModelAndView modelAndView = new ModelAndView("CarOffers");
        modelAndView.addObject("offers", offerService.getAllOffers());
        return modelAndView;
    }

    @RequestMapping(value = "offer", method = RequestMethod.POST, consumes = MediaType.ALL_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    ModelAndView addOffer(@RequestParam Long id,
                        @RequestParam int cena,
                        @RequestParam String data,
                        @RequestParam int klient_id,
                        @RequestParam int samochod_id) throws Exception {

        ModelAndView modelAndView = new ModelAndView("CarOffers");
        try {
            OffersForSaleDto offer = new OffersForSaleDto();
            offer.setId(id);
            offer.setCena(cena);
            offer.setDataWystawienia((Date) df.parse(data));
            offer.setKlienciId(klient_id);
            offer.setSamochodId(samochod_id);
            offer = offerService.addOffer(offer);
            modelAndView.addObject("message", "Offer added with id: " + offer.getId());
        }
        catch (Exception ex){
            modelAndView.addObject("message", "Failed to add offer: " + ex.getMessage());
        }
        modelAndView.addObject("offers", offerService.getAllOffers());
        return modelAndView;
    }

//    @RequestMapping(value = "cars/{model}", method = RequestMethod.GET)
//    public String showCarsByModel(@PathVariable String surname, Model model) {
//        model.addAttribute("search", carService.listCarsbyModel(model));
//        return "cars";
//    }

}

