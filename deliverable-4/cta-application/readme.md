## Chicago CTA Application

Recreates a portion of the functionality from the Chicago metro transit system

From the website https://www.transitchicago.com/ this program has created sample data, modeled from real life use cases for passengers and system administrators, for the following use cases:
- viewing fares
- viewing system alerts (system wide, by station, by line)
- viewing all stops on a particular line

### Setup 
- install [MySQL Wrokbench](https://www.mysql.com/products/workbench/)
- install the open jdk version 25 for your OS
    - mac or linux:
    - `brew install openjdk`

### Start Application

- unzip cta.zip to a directory a directory, eg './cta'
- from within root for './cta'- run database setup scripts:
    - run `./setup-database.sh` (prompts for login, password is 'blank')
    - will prompt for the password 9 times, hit enter for each
    - database will be created and populated with data


- compile the java files into platform independent byte code
    - `javac CTAClient.java`
- run the GUI application (note classpath entry to mysql jdbc driver)
    - `java -cp .:lib/mysql-connector-java.jar CTAClient`



### Functionality

- Creates a new database named chicago_cta and populates with data, see the [cta-schema.png](./cta-schema.png) file for the system ERD

- Alerts
    - view all alerts
    - view system only alerts
    - view alerts only for lines
    - view alerts only for stations
    - create, update and delete each of the 4 types of alerts above
    - enforces proper date time format at the UI layer
    - enforces that start and end dates are in chronological order (at the database layer)

- Fares
    - show all fares
    - add new fare entry (can add a new fare category as well)
    - modify any fare entry
    - delete any fare entry
    - ensures the are no duplicate fare and rider catergory entries (at the database layer)

- Line Detail
    - for each line shows a graphical view of the stops in order and if they are accessible (for train and bus lines)
