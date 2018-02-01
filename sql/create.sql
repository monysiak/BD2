-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-02-01 17:18:28.766

-- tables
-- Table: adresy
CREATE TABLE adresy (
    id int  NOT NULL,
    miasto text  NOT NULL,
    kod_pocztowy text  NOT NULL,
    ulica text  NOT NULL,
    numer_domu text  NOT NULL,
    numer_mieszkania int  NULL,
    CONSTRAINT adresy_pk PRIMARY KEY (id)
);

-- Table: cechy_wyposazenia
CREATE TABLE cechy_wyposazenia (
    id int  NOT NULL,
    opis text  NOT NULL,
    CONSTRAINT cechy_wyposazenia_pk PRIMARY KEY (id)
);

CREATE INDEX cechy_wyposazenia_idx_1 on cechy_wyposazenia USING hash (opis);

-- Table: cechy_wyposazenia_samochodu
CREATE TABLE cechy_wyposazenia_samochodu (
    id int  NOT NULL,
    cechy_wyposazenia_id int  NULL,
    samochody_id int  NULL,
    CONSTRAINT cechy_wyposazenia_samochodu_pk PRIMARY KEY (id)
);

CREATE INDEX cechy_wyposazenia_samochodu_idx_1 on cechy_wyposazenia_samochodu (samochody_id ASC,cechy_wyposazenia_id ASC);

-- Table: kategorie_samochodu
CREATE TABLE kategorie_samochodu (
    id int  NOT NULL,
    opis text  NOT NULL,
    CONSTRAINT kategorie_samochodu_pk PRIMARY KEY (id)
);

-- Table: klienci
CREATE TABLE klienci (
    id int  NOT NULL,
    adresy_id int  NOT NULL,
    imie text  NOT NULL,
    nazwisko text  NOT NULL,
    email text  NULL,
    telefon int  NOT NULL,
    nip int  NULL,
    nazwa_firmy text  NULL,
    CONSTRAINT klienci_pk PRIMARY KEY (id)
);

CREATE INDEX klienci_idx_1 on klienci (adresy_id ASC);

-- Table: modele_samochodow
CREATE TABLE modele_samochodow (
    id int  NOT NULL,
    marka text  NOT NULL,
    model text  NOT NULL,
    wersja_modelu int  NOT NULL DEFAULT 1,
    CONSTRAINT modele_samochodow_pk PRIMARY KEY (id)
);

CREATE INDEX modele_samochodow_idx_1 on modele_samochodow USING hash (model,marka);

-- Table: oferty_kupione
CREATE TABLE oferty_kupione (
    id int  NOT NULL,
    klienci_id int  NOT NULL,
    oferty_na_sprzedaz_id int  NOT NULL,
    kwota_koncowa int  NOT NULL,
    dodatkowe_info text  NULL,
    prowizja_dla_komisu decimal(15,2)  NOT NULL,
    data_kupna date  NOT NULL,
    CONSTRAINT prowizja_i_kwota_dodatnie_check CHECK (prowizja_dla_komisu >= 0.0 and kwota_koncowa > 0) NOT DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT oferty_kupione_pk PRIMARY KEY (id)
);

CREATE INDEX oferty_kupione_idx_1 on oferty_kupione (klienci_id ASC,oferty_na_sprzedaz_id ASC);

CREATE INDEX oferty_kupione_idx_2 on oferty_kupione (oferty_na_sprzedaz_id ASC);

-- Table: oferty_na_sprzedaz
CREATE TABLE oferty_na_sprzedaz (
    id int  NOT NULL,
    samochod_id int  NOT NULL,
    klienci_id int  NOT NULL,
    data_wystawienia date  NOT NULL,
    cena int  NOT NULL,
    czy_kupiony boolean  NOT NULL DEFAULT false,
    CONSTRAINT oferty_na_sprzedaz_pk PRIMARY KEY (id)
);

CREATE INDEX oferty_na_sprzedaz_idx_1 on oferty_na_sprzedaz (samochod_id ASC);

CREATE INDEX oferty_na_sprzedaz_idx_2 on oferty_na_sprzedaz (klienci_id ASC);

-- Table: placowki
CREATE TABLE placowki (
    id int  NOT NULL,
    przedsiebiorstwa_id int  NOT NULL,
    adresy_id int  NOT NULL,
    liczba_miejsc_do_ekspozycji text  NOT NULL,
    telefon text  NOT NULL,
    email text  NULL,
    godziny_otwarcia int  NOT NULL,
    CONSTRAINT placowki_pk PRIMARY KEY (id)
);

CREATE INDEX placowki_idx_1 on placowki (przedsiebiorstwa_id ASC);

CREATE INDEX placowki_idx_2 on placowki (adresy_id ASC);

-- Table: platnosci
CREATE TABLE platnosci (
    id int  NOT NULL,
    oferta_kupiona_id int  NOT NULL,
    status_platnosci_id int  NOT NULL,
    data_wyslania date  NOT NULL,
    data_zaksiegowania date  NOT NULL,
    kwota_platnosci int  NOT NULL,
    CONSTRAINT platnosci_pk PRIMARY KEY (id)
);

CREATE INDEX platnosci_idx_1 on platnosci (oferta_kupiona_id ASC,status_platnosci_id ASC);

-- Table: pracownicy
CREATE TABLE pracownicy (
    id int  NOT NULL,
    placowki_id int  NOT NULL,
    przelozony_id int  NULL,
    adresy_id int  NOT NULL,
    imie text  NOT NULL,
    nazwisko text  NOT NULL,
    email text  NULL,
    telefon int  NOT NULL,
    aktualna_kwota_wynagrodzenia decimal(2,2)  NOT NULL,
    numer_konta_bankowego int  NOT NULL,
    data_przyjecia date  NOT NULL,
    CONSTRAINT pracownicy_pk PRIMARY KEY (id)
);

CREATE INDEX pracownicy_idx_1 on pracownicy (placowki_id ASC);

CREATE INDEX pracownicy_idx_2 on pracownicy (przelozony_id ASC);

-- Table: przedsiebiorstwa
CREATE TABLE przedsiebiorstwa (
    id int  NOT NULL,
    adresy_id int  NOT NULL,
    nazwa text  NOT NULL,
    NIP text  NOT NULL,
    email text  NULL,
    telefon int  NOT NULL,
    CONSTRAINT przedsiebiorstwa_pk PRIMARY KEY (id)
);

CREATE INDEX przedsiebiorstwa_idx_1 on przedsiebiorstwa (adresy_id ASC);

-- Table: samochody
CREATE TABLE samochody (
    id int  NOT NULL,
    placowki_id int  NULL,
    modele_samochodow_id int  NOT NULL,
    kategorie_samochodu_id int  NOT NULL,
    silniki_id int  NOT NULL,
    typ_nadwozia_id int  NOT NULL,
    vin text  NOT NULL,
    rok_produkcji int  NOT NULL,
    przebieg int  NOT NULL,
    kraj_pochodzenia text  NOT NULL,
    czy_bezwypadkowy boolean  NOT NULL,
    rok_rejestracji text  NOT NULL,
    liczba_wlascicieli int  NOT NULL,
    numer_miejsca_na_parkingu int  NULL,
    CONSTRAINT samochod_bez_placowki_z_numerem_miejsca_check CHECK (placowki_id <> null AND numer_miejsca_na_parkingu <> null) NOT DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT samochody_pk PRIMARY KEY (id)
);

CREATE INDEX samochody_idx_1 on samochody (placowki_id ASC);

CREATE INDEX samochody_idx_2 on samochody (modele_samochodow_id ASC);

CREATE INDEX samochody_idx_3 on samochody (kategorie_samochodu_id ASC,typ_nadwozia_id ASC);

CREATE INDEX samochody_idx_4 on samochody (silniki_id ASC);

CREATE INDEX samochody_idx_5 on samochody USING hash (przebieg,rok_produkcji,liczba_wlascicieli);

-- Table: silniki
CREATE TABLE silniki (
    id int  NOT NULL,
    pojemnosc int  NOT NULL,
    moc int  NOT NULL,
    rodzaj_paliwa text  NOT NULL,
    CONSTRAINT silniki_pk PRIMARY KEY (id)
);

-- Table: stanowiska
CREATE TABLE stanowiska (
    id int  NOT NULL,
    nazwa text  NOT NULL,
    min_wynagrodzenie decimal(2,2)  NOT NULL,
    max_wynagrodzenie decimal(2,2)  NULL,
    CONSTRAINT stanowiska_pk PRIMARY KEY (id)
);

-- Table: stanowiska_pracownikow
CREATE TABLE stanowiska_pracownikow (
    stanowiska_id int  NOT NULL,
    pracownicy_id int  NOT NULL,
    CONSTRAINT pk PRIMARY KEY (stanowiska_id,pracownicy_id)
);

CREATE INDEX stanowiska_pracownikow_idx_1 on stanowiska_pracownikow (stanowiska_id ASC,pracownicy_id ASC);

-- Table: status_platnosci
CREATE TABLE status_platnosci (
    id int  NOT NULL,
    kod_statusu text  NOT NULL,
    status text  NOT NULL,
    CONSTRAINT status_platnosci_pk PRIMARY KEY (id)
);

-- Table: typ_nadwozia
CREATE TABLE typ_nadwozia (
    id int  NOT NULL,
    liczba_drzwi int  NOT NULL,
    liczba_miejsc int  NOT NULL,
    nazwa text  NOT NULL,
    CONSTRAINT typ_nadwozia_pk PRIMARY KEY (id)
);

-- Table: urlopy_pracownikow
CREATE TABLE urlopy_pracownikow (
    id int  NOT NULL,
    pracownicy_id int  NOT NULL,
    od date  NOT NULL,
    "do" date  NOT NULL,
    czy_platny boolean  NOT NULL,
    CONSTRAINT urlopy_pracownikow_pk PRIMARY KEY (id)
);

CREATE INDEX urlopy_pracownikow_idx_1 on urlopy_pracownikow (pracownicy_id ASC);

-- Table: wyplacone_wynagrodzenia
CREATE TABLE wyplacone_wynagrodzenia (
    id int  NOT NULL,
    pracownicy_id int  NOT NULL,
    kwota decimal(2,2)  NOT NULL,
    data date  NOT NULL,
    czy_na_konto boolean  NOT NULL,
    CONSTRAINT wyplacone_wynagrodzenia_pk PRIMARY KEY (id)
);

CREATE INDEX wyplacone_wynagrodzenia_idx_1 on wyplacone_wynagrodzenia (pracownicy_id ASC);

-- foreign keys
-- Reference: cechy_wyposazenia_samochodu_cechy_wyposazenia (table: cechy_wyposazenia_samochodu)
ALTER TABLE cechy_wyposazenia_samochodu ADD CONSTRAINT cechy_wyposazenia_samochodu_cechy_wyposazenia
    FOREIGN KEY (cechy_wyposazenia_id)
    REFERENCES cechy_wyposazenia (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: cechy_wyposazenia_samochodu_samochody (table: cechy_wyposazenia_samochodu)
ALTER TABLE cechy_wyposazenia_samochodu ADD CONSTRAINT cechy_wyposazenia_samochodu_samochody
    FOREIGN KEY (samochody_id)
    REFERENCES samochody (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: klienci_adresy (table: klienci)
ALTER TABLE klienci ADD CONSTRAINT klienci_adresy
    FOREIGN KEY (adresy_id)
    REFERENCES adresy (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: oferta_kupna_klienci (table: oferty_kupione)
ALTER TABLE oferty_kupione ADD CONSTRAINT oferta_kupna_klienci
    FOREIGN KEY (klienci_id)
    REFERENCES klienci (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: oferta_kupna_oferty_na_sprzedaz (table: oferty_kupione)
ALTER TABLE oferty_kupione ADD CONSTRAINT oferta_kupna_oferty_na_sprzedaz
    FOREIGN KEY (oferty_na_sprzedaz_id)
    REFERENCES oferty_na_sprzedaz (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: oferty_na_sprzedaz_klienci (table: oferty_na_sprzedaz)
ALTER TABLE oferty_na_sprzedaz ADD CONSTRAINT oferty_na_sprzedaz_klienci
    FOREIGN KEY (klienci_id)
    REFERENCES klienci (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: placowki_adresy (table: placowki)
ALTER TABLE placowki ADD CONSTRAINT placowki_adresy
    FOREIGN KEY (adresy_id)
    REFERENCES adresy (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: placowki_przedsiebiorstwa (table: placowki)
ALTER TABLE placowki ADD CONSTRAINT placowki_przedsiebiorstwa
    FOREIGN KEY (przedsiebiorstwa_id)
    REFERENCES przedsiebiorstwa (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: platnosci_oferta_kupna (table: platnosci)
ALTER TABLE platnosci ADD CONSTRAINT platnosci_oferta_kupna
    FOREIGN KEY (oferta_kupiona_id)
    REFERENCES oferty_kupione (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: platnosci_status_platnosci (table: platnosci)
ALTER TABLE platnosci ADD CONSTRAINT platnosci_status_platnosci
    FOREIGN KEY (status_platnosci_id)
    REFERENCES status_platnosci (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: pracownicy_adresy (table: pracownicy)
ALTER TABLE pracownicy ADD CONSTRAINT pracownicy_adresy
    FOREIGN KEY (adresy_id)
    REFERENCES adresy (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: pracownicy_placowki (table: pracownicy)
ALTER TABLE pracownicy ADD CONSTRAINT pracownicy_placowki
    FOREIGN KEY (placowki_id)
    REFERENCES placowki (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: pracownicy_pracownicy (table: pracownicy)
ALTER TABLE pracownicy ADD CONSTRAINT pracownicy_pracownicy
    FOREIGN KEY (przelozony_id)
    REFERENCES pracownicy (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: przedsiebiorstwa_adresy (table: przedsiebiorstwa)
ALTER TABLE przedsiebiorstwa ADD CONSTRAINT przedsiebiorstwa_adresy
    FOREIGN KEY (adresy_id)
    REFERENCES adresy (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: samochody_kategorie_samochodu (table: samochody)
ALTER TABLE samochody ADD CONSTRAINT samochody_kategorie_samochodu
    FOREIGN KEY (kategorie_samochodu_id)
    REFERENCES kategorie_samochodu (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: samochody_modele_samochodow (table: samochody)
ALTER TABLE samochody ADD CONSTRAINT samochody_modele_samochodow
    FOREIGN KEY (modele_samochodow_id)
    REFERENCES modele_samochodow (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: samochody_oferty_na_sprzedaz (table: oferty_na_sprzedaz)
ALTER TABLE oferty_na_sprzedaz ADD CONSTRAINT samochody_oferty_na_sprzedaz
    FOREIGN KEY (samochod_id)
    REFERENCES samochody (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: samochody_placowki (table: samochody)
ALTER TABLE samochody ADD CONSTRAINT samochody_placowki
    FOREIGN KEY (placowki_id)
    REFERENCES placowki (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: samochody_silniki (table: samochody)
ALTER TABLE samochody ADD CONSTRAINT samochody_silniki
    FOREIGN KEY (silniki_id)
    REFERENCES silniki (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: samochody_typ_nadwozia (table: samochody)
ALTER TABLE samochody ADD CONSTRAINT samochody_typ_nadwozia
    FOREIGN KEY (typ_nadwozia_id)
    REFERENCES typ_nadwozia (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: stanowiska_pracownikow_pracownicy (table: stanowiska_pracownikow)
ALTER TABLE stanowiska_pracownikow ADD CONSTRAINT stanowiska_pracownikow_pracownicy
    FOREIGN KEY (pracownicy_id)
    REFERENCES pracownicy (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: stanowiska_pracownikow_stanowiska (table: stanowiska_pracownikow)
ALTER TABLE stanowiska_pracownikow ADD CONSTRAINT stanowiska_pracownikow_stanowiska
    FOREIGN KEY (stanowiska_id)
    REFERENCES stanowiska (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: urlopy_pracownikow_pracownicy (table: urlopy_pracownikow)
ALTER TABLE urlopy_pracownikow ADD CONSTRAINT urlopy_pracownikow_pracownicy
    FOREIGN KEY (pracownicy_id)
    REFERENCES pracownicy (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wyplacone_wynagrodzenia_pracownicy (table: wyplacone_wynagrodzenia)
ALTER TABLE wyplacone_wynagrodzenia ADD CONSTRAINT wyplacone_wynagrodzenia_pracownicy
    FOREIGN KEY (pracownicy_id)
    REFERENCES pracownicy (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- sequences
-- Sequence: adresy_seq
CREATE SEQUENCE adresy_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: cechy_wyposazenia_samochodu_seq
CREATE SEQUENCE cechy_wyposazenia_samochodu_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: cechy_wyposazenia_seq
CREATE SEQUENCE cechy_wyposazenia_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: kategorie_samochodu_seq
CREATE SEQUENCE kategorie_samochodu_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: klienci_seq
CREATE SEQUENCE klienci_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: modele_samochodow_seq
CREATE SEQUENCE modele_samochodow_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: oferty_kupione_seq
CREATE SEQUENCE oferty_kupione_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: oferty_na_sprzedaz_seq
CREATE SEQUENCE oferty_na_sprzedaz_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: placowki_seq
CREATE SEQUENCE placowki_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: platnosci_seq
CREATE SEQUENCE platnosci_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: pracownicy_seq
CREATE SEQUENCE pracownicy_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: przedsiebiorstwa_seq
CREATE SEQUENCE przedsiebiorstwa_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: samochody_seq
CREATE SEQUENCE samochody_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: silniki_seq
CREATE SEQUENCE silniki_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: stanowiska_seq
CREATE SEQUENCE stanowiska_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: status_platnosci_seq
CREATE SEQUENCE status_platnosci_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: typ_nadwozia_seq
CREATE SEQUENCE typ_nadwozia_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: urlopy_pracownikow_seq
CREATE SEQUENCE urlopy_pracownikow_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- Sequence: wyplacone_wynagrodzenia_seq
CREATE SEQUENCE wyplacone_wynagrodzenia_seq
      NO MINVALUE
      NO MAXVALUE
      NO CYCLE
;

-- End of file.

