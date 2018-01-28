package org.eiti.komis.dto;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="samochody", schema = "public")
public class CarDto {

    private @Id
    @GeneratedValue
    Long id;
    int vin;
    int rokProdukcji;
    int przebieg;
    String krajPochodzenia;
    boolean bezwypadkowy;
    int rokRejestracji;
    int liczbaWlascicieli;
    int numerMiejscanaParkingu;

    public CarDto() {}

    @Id
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getVin() {
        return vin;
    }

    public void setVin(int vin) {
        this.vin = vin;
    }

    public int getRokProdukcji() {
        return rokProdukcji;
    }

    public void setRokProdukcji(int rok_produkcji) {
        this.rokProdukcji = rok_produkcji;
    }

    public int getRokRejestracji() {
        return rokRejestracji;
    }

    public void setRokRejestracji(int rok_rejestracji) {
        this.rokRejestracji = rok_rejestracji;
    }

    public String getKrajPochodzenia() {
        return krajPochodzenia;
    }

    public void setKrajPochodzenia(String kraj_pochodzenia) {
        this.krajPochodzenia = kraj_pochodzenia;
    }
}
