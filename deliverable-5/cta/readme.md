## Chicago CTA Application

Recreates a portion of the functionality from the Chicago metro transit system

From the website https://www.transitchicago.com/ this program has created sample data, modeled from real life use cases for passengers and system administrators, for the following use cases:
- Planning Trips
- Viewing 'Hub' stations
- Viewing Most Accessible Lines
- Viewing fares
- Viewing system alerts (system wide, by station, by line)
- Viewing all stops on a particular line
- Viewing train wait times between arrivals for a 2-hour window (by line/station/day/direction)

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

#### User Trip Planner Screen: (deliverable #5)
This new panel in the Java Swing application gives users the ability to plan a trip via combinations of train or bus between 2 stations.

It allows for direct routes on one line or at most 1 transfer, can be between trains or buses.

The system infers the direction of travel, either northbound or southbound, as the data for stations times is tightly coupled to the station sequence order.  Ie, station with sequence order:
```
1
↓      
2
↓ 
3 

with a user travelling southbound, the stations times would be accending ie:

11:01am
↓ 
11:10am
↓ 
11:15am

and the reverse would be true for travelling northbound

when querying for the time data, if there is no data in the inital query (based on direction and station sequence order), then it retries for the other direction
```


### SQL Functions Implemented Per UI Feature:


#### Feature - Plan Trip:
- SQL Function - Set Membership:
    - `sp_find_transfer_route` in `./scripts/stored-procedure.sql`
        - **summary:** the heart of the system, we know we need a transfer at this point because the sp_find_direct_route did not return a value, here we ensure that we only have at most 1 transfer by limiting the self join to 'twice', slA, slB, l1, l2. Using the 'IN' constrain lines so that they contain the station in context  to the first line and then stations contstrained to the 2nd line where those stations are in both lines, making sure to not include the start or end station and making sure both lines are unique.
- SQL Function - WITH Clause:
    - `sp_get_trip_schedule` in `./scripts/stored-procedure.sql`
        - summary: a `WITH` clause defines 2 common table expressions: start_times and end_times, since we order by the timeOfDay field we can assign a row number (using window function `ROW_NUMBER`) to each time and ensure the times are increasing sequentially.  The start_times and end_times at this point are essentially the full schedule per respective start station and end station.  The final select then pairs by row number and ensures that the arrival time for the destination station is after the departure time for starting station.  The data only has one time in it, trains arrive and depart within the same minute.  The scheudle data is built with the direction in mind, the line order of the stations and the direction are key - either northbound or southbound.  For example, soundbound trains have accending times from along acceding station order, and northbound trains have accending times along decending station order. The direction and station sequence jointly determine the logical flow of time across the line, which we see in the UI when we plan a trip (infers northbound or southbound)

- SQL Function - Advanced Aggregate:
    - `sp_find_direct_route` in `./scripts/stored-procedure.sql`
        - summary: This is a relational division pattern, we group by line and make sure that each line has ALL the required stations (this 'all' is the divisional key, and the implementation is the: `HAVING COUNT(DISTINCT s.name) = 2;` clause.  It uses a set filter with `IN` to restrict to only the stations we're interested in (start/end stations).  The having clause is also the 'advanced aggregate' part (`count distinct`) and enforces that the line has 2 and the only 2 stations we are interested in, thusly guaranting that this line services both stations.
        Side note, because the `count` appears after the `HAVING` clause it is evaluated after grouping, that is key for this to work.

- SQL Function - OLAP:
    - `sp_get_trip_stats` in `./scripts/stored-procedure.sql`
        - summary: much the same as the `sp_get_trip_schedule` since we have each rows duration, as the difference between departure and arrival times, we can then use the OLAP aggregate functions to find the average, minimum and maximum trips times for every start station and end station trip, per direction and time of day. This queries combines: CTE, window functions and adds the advanced aggregate functions (avg, min, max) qualifying it for as an OLAP

#### Feature - Hub Stations (service both train and bus):

- SQL Function - Set Operation: `Intersect`:
    - `v_transfer_hubs` in `./scripts/create-views.sql` 
        - summary: find all stations that service trains and find all stations that service buses, then take only the rows that are common to both (`intersect`), now query for the details we want, station name and lines and filter by the result set from the intersection

#### Feature - Most Accessible Stations:

- SQL Function - Set Comparison:
    - `v_most_accessible_lines` in `./scripts/create-views.sql` 
        - summary: compare each lines aggregated accessible station count to the set of all other lines' aggregated accessible station counts and return only lines whose counts are higher, or equal, to every other count (another way of saying max aggregation)




#

#### Administration Screens: (deliverable #4)
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