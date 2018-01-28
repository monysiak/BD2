package org.eiti.komis.repositories;

import org.eiti.komis.dto.CarDto;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 */
@Repository
public interface CarRepository extends CrudRepository<CarDto, Long> {
}
