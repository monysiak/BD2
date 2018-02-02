package org.eiti.komis.repositories;



import org.eiti.komis.dto.PaymentDto;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 */
@Repository
public interface PaymentRepository extends CrudRepository<PaymentDto, Long> {
    PaymentDto findById(Long id);
}
