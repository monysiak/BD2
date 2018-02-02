package org.eiti.komis.services;

import org.eiti.komis.dto.PaymentDto;
import org.eiti.komis.repositories.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    public PaymentDto addPayment(PaymentDto payment) {
        paymentRepository.save(payment);
        return payment;
    }

    public Iterable<PaymentDto> getAllPayments() {
        return paymentRepository.findAll();
    }
}
