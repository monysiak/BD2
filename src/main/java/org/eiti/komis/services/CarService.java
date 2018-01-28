package org.eiti.komis.services;

import org.eiti.komis.dto.CarDto;
import org.eiti.komis.repositories.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarService {
    @Autowired
    private CarRepository carRepository;

    public CarDto addCar(CarDto car) {
        carRepository.save(car);
        return car;
    }

    public Iterable<CarDto> getCars() {
        return carRepository.findAll();
    }
}
