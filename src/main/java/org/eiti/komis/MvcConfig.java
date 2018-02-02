package org.eiti.komis;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class MvcConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/home").setViewName("home");
        registry.addViewController("/").setViewName("home");
        registry.addViewController("/hello").setViewName("hello");
        registry.addViewController("/cars").setViewName("CarPage");
        registry.addViewController("/caroffers").setViewName("CarOffers");
        registry.addViewController("/login").setViewName("Login");
        registry.addViewController("/company").setViewName("Company");
        registry.addViewController("/offers").setViewName("Offers");
        registry.addViewController("/contact").setViewName("Contact");
        registry.addViewController("/payment").setViewName("Payment");
        registry.addViewController("/carshop").setViewName("CarPageShop");
    }

}