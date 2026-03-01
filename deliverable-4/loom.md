## Outline

- this application models the Chicago Transit System aka CTA 
- uses with Java and Swing UI components and the MySQL database

- database has been created and loaded with data

- main functionality are crud operations on:
    - Fares
    - Alerts
        - system wide
        - for train line(s) and/or station(s)
- view all stops in order for any line graphically

Fares:
- select to update or delete
- database enforces non duplicate fare categories and rider catergories
- can add new Fare categories 
- validates numeric entries at the database

Alerts:
- all alerts
- only system alerts
- start/end handled on database level with a trigger on before update and create
- date format handled on the UI level


Line and Station Alerts
- same functionality
- station and line alerts can share the same alert - show ERD
- database enforced duplicate alerts via primary key constraints 
- delete an alert in the parent table will cascade to child line/station alert tables
- updating a parent alert will be shown on the child view tables for line/station


View Stops
- currently read only, next step is to add in schedules and trip planning
- uses stored procedure


- deliverable #3 Loom Video Link

    - https://www.loom.com/share/fad65a861faa4a74b003ffff49607c65