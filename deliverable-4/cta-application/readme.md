## Chicago CTA Application

Recreates a portion of the functionality from the Chicago metro transit system

From the website https://www.transitchicago.com/ this program has created sample data, modeled from real life use cases for passengers and system administrator, for the following use cases:
- viewing fares
- viewing system alerts (system wide, by station, by line)
- viewing schedules of trains and buses
- planning trips
- viewing all stops on a particular line

### Setup 

- install the open jdk version 25 for your OS
- mac or linux
- `brew install openjdk`
- install mysql
- run database setup scripts:
    - `setup-database.sh` (prompts for login, password is 'blank')
    - will prompt for the password 9 times, hit enter for each
    - database is not created with data

### Start Application

- unzip cta.zip to a directory a directory, eg './cta'
- from within root for './cta'
- `java -cp .:lib/mysql-connector-java.jar CTAClient`



### Functionality

- load database with data

- Alerts
    - view all alerts
    - select 1 alert
        - update
        - delete
    - enter new alert
        - alert details, line or station