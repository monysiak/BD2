package org.eiti.komis.repositories;

import org.eiti.komis.dto.OffersForSaleDto;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OfferForSaleRepository extends CrudRepository<OffersForSaleDto, Integer> {

}