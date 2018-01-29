package org.eiti.komis.services;

import org.eiti.komis.dto.OffersForSaleDto;
import org.eiti.komis.repositories.OfferForSaleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OfferService {

    @Autowired
    private OfferForSaleRepository offerForSaleRepository;

    public OffersForSaleDto addOffer(OffersForSaleDto offer) {
        offerForSaleRepository.save(offer);
        return offer;
    }

    public Iterable<OffersForSaleDto> getAllOffers() {
        return offerForSaleRepository.findAll();
    }
}
