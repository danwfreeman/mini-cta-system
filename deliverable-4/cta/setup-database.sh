#!/bin/bash

echo "Creating database...enter to continue (blank password)"
mysql -u root -p < ./scripts/create-database.sql;
echo "Creating tables...enter to continue (blank password)"
mysql -u root -p < ./scripts/create-tables.sql;
echo "Creating indexes...enter to continue (blank password)"
mysql -u root -p < ./scripts/create-indexes.sql;
echo "Creating triggers...enter to continue (blank password)"
mysql -u root -p < ./scripts/create-triggers.sql;
echo "Creating views...enter to continue (blank password)"
mysql -u root -p < ./scripts/create-views.sql;
echo "Inserting general data...enter to continue (blank password)"
mysql -u root -p < ./scripts/insert-general-data.sql;
echo "Inserting schedule data...enter to continue (blank password)"
mysql -u root -p < ./scripts/insert-schedule-data.sql;
echo "Creating functions...enter to continue (blank password)"
mysql -u root -p < ./scripts/functions.sql;
echo "Creating stored procedures...enter to continue (blank password)"
mysql -u root -p < ./scripts/stored-procedure.sql;

