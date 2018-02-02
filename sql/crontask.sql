insert into zysk_raport (suma_zyskow , miesiac)
select sum(cena)*0.01 , to_char(now(), 'HH12:MI:SS') from oferty_na_sprzedaz where czy_kupiony = 'true' and data_wystawienia < now();
