-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-02-01 17:18:28.766

-- foreign keys
ALTER TABLE cechy_wyposazenia_samochodu
    DROP CONSTRAINT cechy_wyposazenia_samochodu_cechy_wyposazenia;

ALTER TABLE cechy_wyposazenia_samochodu
    DROP CONSTRAINT cechy_wyposazenia_samochodu_samochody;

ALTER TABLE klienci
    DROP CONSTRAINT klienci_adresy;

ALTER TABLE oferty_kupione
    DROP CONSTRAINT oferta_kupna_klienci;

ALTER TABLE oferty_kupione
    DROP CONSTRAINT oferta_kupna_oferty_na_sprzedaz;

ALTER TABLE oferty_na_sprzedaz
    DROP CONSTRAINT oferty_na_sprzedaz_klienci;

ALTER TABLE placowki
    DROP CONSTRAINT placowki_adresy;

ALTER TABLE placowki
    DROP CONSTRAINT placowki_przedsiebiorstwa;

ALTER TABLE platnosci
    DROP CONSTRAINT platnosci_oferta_kupna;

ALTER TABLE platnosci
    DROP CONSTRAINT platnosci_status_platnosci;

ALTER TABLE pracownicy
    DROP CONSTRAINT pracownicy_adresy;

ALTER TABLE pracownicy
    DROP CONSTRAINT pracownicy_placowki;

ALTER TABLE pracownicy
    DROP CONSTRAINT pracownicy_pracownicy;

ALTER TABLE przedsiebiorstwa
    DROP CONSTRAINT przedsiebiorstwa_adresy;

ALTER TABLE samochody
    DROP CONSTRAINT samochody_kategorie_samochodu;

ALTER TABLE samochody
    DROP CONSTRAINT samochody_modele_samochodow;

ALTER TABLE oferty_na_sprzedaz
    DROP CONSTRAINT samochody_oferty_na_sprzedaz;

ALTER TABLE samochody
    DROP CONSTRAINT samochody_placowki;

ALTER TABLE samochody
    DROP CONSTRAINT samochody_silniki;

ALTER TABLE samochody
    DROP CONSTRAINT samochody_typ_nadwozia;

ALTER TABLE stanowiska_pracownikow
    DROP CONSTRAINT stanowiska_pracownikow_pracownicy;

ALTER TABLE stanowiska_pracownikow
    DROP CONSTRAINT stanowiska_pracownikow_stanowiska;

ALTER TABLE urlopy_pracownikow
    DROP CONSTRAINT urlopy_pracownikow_pracownicy;

ALTER TABLE wyplacone_wynagrodzenia
    DROP CONSTRAINT wyplacone_wynagrodzenia_pracownicy;

-- tables
DROP TABLE adresy;

DROP TABLE cechy_wyposazenia;

DROP TABLE cechy_wyposazenia_samochodu;

DROP TABLE kategorie_samochodu;

DROP TABLE klienci;

DROP TABLE modele_samochodow;

DROP TABLE oferty_kupione;

DROP TABLE oferty_na_sprzedaz;

DROP TABLE placowki;

DROP TABLE platnosci;

DROP TABLE pracownicy;

DROP TABLE przedsiebiorstwa;

DROP TABLE samochody;

DROP TABLE silniki;

DROP TABLE stanowiska;

DROP TABLE stanowiska_pracownikow;

DROP TABLE status_platnosci;

DROP TABLE typ_nadwozia;

DROP TABLE urlopy_pracownikow;

DROP TABLE wyplacone_wynagrodzenia;

-- sequences
DROP SEQUENCE IF EXISTS adresy_seq;

DROP SEQUENCE IF EXISTS cechy_wyposazenia_samochodu_seq;

DROP SEQUENCE IF EXISTS cechy_wyposazenia_seq;

DROP SEQUENCE IF EXISTS kategorie_samochodu_seq;

DROP SEQUENCE IF EXISTS klienci_seq;

DROP SEQUENCE IF EXISTS modele_samochodow_seq;

DROP SEQUENCE IF EXISTS oferty_kupione_seq;

DROP SEQUENCE IF EXISTS oferty_na_sprzedaz_seq;

DROP SEQUENCE IF EXISTS placowki_seq;

DROP SEQUENCE IF EXISTS platnosci_seq;

DROP SEQUENCE IF EXISTS pracownicy_seq;

DROP SEQUENCE IF EXISTS przedsiebiorstwa_seq;

DROP SEQUENCE IF EXISTS samochody_seq;

DROP SEQUENCE IF EXISTS silniki_seq;

DROP SEQUENCE IF EXISTS stanowiska_seq;

DROP SEQUENCE IF EXISTS status_platnosci_seq;

DROP SEQUENCE IF EXISTS typ_nadwozia_seq;

DROP SEQUENCE IF EXISTS urlopy_pracownikow_seq;

DROP SEQUENCE IF EXISTS wyplacone_wynagrodzenia_seq;

-- End of file.

