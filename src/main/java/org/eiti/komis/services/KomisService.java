package org.eiti.komis.services;


import org.eiti.komis.dto.CarDto;
import org.eiti.komis.repositories.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KomisService {

    @Autowired
    private CarRepository carRepository;

    public Iterable<CarDto> getAllCars() {
        return carRepository.findAll();
    }

}
