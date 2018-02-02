package org.eiti.komis.dto;


import javax.persistence.*;

@Entity
@Table(name="modele_samochodow", schema = "public")
public class CarModelDto {

    private @Id
    @GeneratedValue
    Long id;
    @Column(name="model")
    String model;
    @Column(name="marka")
    String marka;
    @Column(name="wersja_modelu")
    int wersjaModelu;

    public CarModelDto() {}

    @Id
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getModel() {
        return model;
    }

    public void setModel(int vin) {
        this.model = model;
    }

    public String getMarka() {
        return marka;
    }

    public void setMarka(String marka) {
        this.marka = marka;
    }

    public int getWersjaModelu() {
        return wersjaModelu;
    }

    public void setWersjaModelu(int wersjaModelu) {
        this.wersjaModelu = wersjaModelu;
    }
}
