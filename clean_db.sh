#!/usr/bin/env bash

psql komis komis -f sql/drop.sql > /dev/null
psql komis komis -f sql/create.sql > /dev/null
./insert_clean_data dict
./insert_clean_data test
./insert_clean_data man oferty_na_sprzedaz.csv
./insert_clean_data man cechy_wyposazenia_samochodu.csv


