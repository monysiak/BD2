package org.eiti.komis.repositories;

import org.eiti.komis.dto.CarDto;
import org.eiti.komis.dto.CustomerDto;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 */
@Repository
public interface CustomerRepository extends CrudRepository<CustomerDto, Long> {
    CustomerDto findByEmail(String email);
}

