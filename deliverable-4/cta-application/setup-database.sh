#!/bin/bash

mysql -u root -p < ./scripts/create-database.sql;
mysql -u root -p < ./scripts/create-tables.sql;
mysql -u root -p < ./scripts/create-indexes.sql;
mysql -u root -p < ./scripts/create-triggers.sql;
mysql -u root -p < ./scripts/create-views.sql;
mysql -u root -p < ./scripts/insert-general-data.sql;
mysql -u root -p < ./scripts/insert-schedule-data.sql;
mysql -u root -p < ./scripts/functions.sql;
mysql -u root -p < ./scripts/stored-procedure.sql;

