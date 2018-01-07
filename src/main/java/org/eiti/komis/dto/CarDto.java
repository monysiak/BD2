package org.eiti.komis.dto;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "samochody")
public class CarDto {

    private @Id
    @GeneratedValue
    Long id;

    public CarDto() {}

}
