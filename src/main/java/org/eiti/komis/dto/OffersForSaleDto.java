package org.eiti.komis.dto;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name="oferty_na_sprzedaz", schema = "public")
public class OffersForSaleDto {

    private @Id
    @GeneratedValue
    @Column(name = "id")
    Long id;
    @Column(name = "samochod_id")
    Long samochod_id;
    @Column(name = "klienci_id")
    int klienci_id;
    @Column(name = "data_wystawienia")
    Date data_wystawienia;
    @Column(name = "cena")
    int cena;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getSamochodId() {
        return samochod_id;
    }

    public void setSamochodId(long samochod_id) {
        this.samochod_id = samochod_id;
    }

    public long getKlienciId() {
        return klienci_id;
    }
    public void setKlienciId(long klienciId) {
        this.klienci_id = klienci_id;
    }

    public Date getDataWystawienia() {
        return data_wystawienia;
    }
    public void setDataWystawienia(Date data_wystawienia) {
        this.data_wystawienia = data_wystawienia;
    }

    public int getCena() {
        return cena;
    }
    public void setCena(int cena) {
        this.cena = cena;
    }

}
