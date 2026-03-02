## Chicago CTA Application

Recreates a portion of the functionality from the Chicago metro transit system

From the website https://www.transitchicago.com/ this program has created sample data, modeled from real life use cases for passengers and system administrators, for the following use cases:
- viewing fares
- viewing system alerts (system wide, by station, by line)
- viewing all stops on a particular line
- viewing train wait times between arrivals for a 2-hour window (by line/station/day/direction)

### Setup 
- install [MySQL Workbench](https://www.mysql.com/products/workbench/)
- install the open jdk version 25 for your OS
    - mac or linux:
    - `brew install openjdk`

### Start Application

- unzip cta.zip to a directory, eg './cta'
- from within the root of './cta', run database setup scripts:
    - run `./setup-database.sh` (prompts for login, password is 'blank')
    - will prompt for the password 9 times, hit enter for each
    - database will be created and populated with data


- (optional, files already compiled in zip) compile the java files into platform independent byte code
    - `javac CTAClient.java`
- run the GUI application (note classpath entry for the mysql jdbc driver)
    - `java -cp ".:lib/*" CTAClient`



### Functionality

- Creates a new database named chicago_cta and populates with data, see the [cta-schema.png](./cta-schema.png) file for the system ERD


### Final Summation

#### User Trip Planner Screen: (deliverable #5) - use cases per UI feature

- Plan Trip Feature:
    - Set Membership
        - `sp_find_transfer_route` in `./scripts/stored-procedure.sql`
            - **summary:** the heart of the system, we know we need a transfer at this point because the sp_find_direct_route did not return a value, here we ensure that we only have at most 1 transfer by limiting the self join to 'twice', slA, slB, l1, l2. Using the 'IN' constrain lines so that they contain the station in context  to the first line and then stations contstrained to the 2nd line where those stations are in both lines, making sure to not include the start or end station and making sure both lines are unique.
    - With Clause
        - `sp_get_trip_schedule` in `./scripts/stored-procedure.sql`
            - summary:
        - `sp_get_trip_stats` in `./scripts/stored-procedure.sql`
            - summary:
    - Advanced Aggregate
        - `sp_get_trip_schedule` in `./scripts/stored-procedure.sql`
            - summary:
    - OLAP
        - `sp_get_trip_stats` in `./scripts/stored-procedure.sql`

- Hub Stations (service both train and bus) Feature:
    - Set operation: `Intersect`
        - `v_transfer_hubs` in `./scripts/create-views.sql` 
            - summary:

- Most Accessible Stations Feature
    - Set Comparison
        - `v_most_accessible_lines` in `./scripts/create-views.sql` 
            - summary:
    





- Administration Screens: (deliverable #4)
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
        - ensures the are no duplicate fare and rider category entries (at the database layer)

    - Line Detail
        - for each line shows a graphical view of the stops in order and if they are accessible (for train and bus lines)

    - Window Wait Times
        - choose line, station, day type, direction, and a 2-hour time window
        - returns each arrival, the next arrival, and minutes until next train
        - filters out rows where no next arrival exists in-window