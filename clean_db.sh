#!/usr/bin/env bash

psql komis komis -f sql/drop.sql > /dev/null
psql komis komis -f sql/create.sql > /dev/null
./insert_clean_data dict