package org.eiti.komis.dto;


import javax.persistence.*;

@Entity
@Table(name = "klienci")
public class CustomerDto {

    @Id
    @GeneratedValue
    @Column(name="id")
    private Long id;

    @Column(name="imie")
    private String imie;
    @Column(name="nazwisko")
    private String nazwisko;
    @Column(name="email")
    private String email;
    @Column(name="telefon")
    private String telefon;
    @Column(name="nip")
    private String nip;
    @Column(name="nazwa_firmy")
    private String nazwa_firmy;
//    @Column(name="haslo")
//    String haslo;
//    @Column(name="rola")
//    String role;

    public CustomerDto() {}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public String getImie() {
        return imie;
    }

    public void setImie(String imie) {
        this.imie = imie;
    }

    public String getNazwisko() {
        return nazwisko;
    }

    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getNip() {
        return nip;
    }

    public void setNip(String nip) {
        this.nip = nip;
    }

    public String getNazwa_firmy() {
        return nazwa_firmy;
    }

    public void setNazwa_firmy(String nazwa_firmy) {
        this.nazwa_firmy = nazwa_firmy;
    }

//    public String getHaslo() {
//        return haslo;
//    }
//
//    public void setHaslo(String haslo) {
//        this.haslo = haslo;
//    }
//
//    public String getRole() {
//        return role;
//    }
//
//    public void setRole(String role) {
//        this.role = role;
//    }
}
