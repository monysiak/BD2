package org.eiti.komis.dto;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.sql.Date;

public class PaymentDto {
    private @Id
    @GeneratedValue
    @Column(name = "id")
    Long id;
    @Column(name = "oferta_kupiona_id")
    Long oferta_kupiona_id;
    @Column(name = "status_platnosci_id")
    Long status_platnosci_id;
    @Column(name = "Data_wyslania")
    Date data_wyslania;
    @Column(name = "data_zaksiegowania")
    Date data_zaksiegowania;
    @Column(name = "kwota_platnosci")
    int kwota_platnosci;
;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getOferta_kupiona_id() {
        return oferta_kupiona_id;
    }

    public void setOferta_kupiona_id(long id) {
        this.oferta_kupiona_id = id;
    }

    public Date getData_wyslania() {
        return data_wyslania;
    }
    public void setData_wyslania(java.util.Date data) {
        this.data_wyslania = data_wyslania;
    }

    public Date getData_zaksiegowania() {
        return data_zaksiegowania;
    }
    public void setData_zaksiegowania(Date data_zaksiegowania) {
        this.data_zaksiegowania = data_zaksiegowania;
    }

    public int getKwota_platnosci() {
        return kwota_platnosci;
    }
    public void setKwota_platnosci(int cena) {
        this.kwota_platnosci = cena;
    }
}
