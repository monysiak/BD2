package org.eiti.komis.dto;


import javax.persistence.*;

@Entity
@Table(name="samochody", schema = "public")
public class CarDto {

    @Id
    @GeneratedValue
    private Long id;
    @Column(name="vin")
    private int vin;
    @Column(name="rok_produkcji")
    private int rokProdukcji;
    @Column(name="przebieg")
    private int przebieg;
    @Column(name="kraj_pochodzenia")
    private String krajPochodzenia;
    @Column(name="czy_bezwypadkowy")
    private boolean bezwypadkowy;
    @Column(name="rok_rejestracji")
    private int rokRejestracji;
    @Column(name="liczba_wlascicieli")
    private int liczbaWlascicieli;
    @Column(name="numer_miejsca_na_parkingu")
    private int numerMiejscanaParkingu;

    public CarDto() {}

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
