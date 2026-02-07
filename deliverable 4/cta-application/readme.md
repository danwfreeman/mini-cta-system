## Chicago CTA Application

Recreates a portion of the functionality from the Chicago metro transit system

From the website https://www.transitchicago.com/ this program has created sample data, modeled from real life use cases for passengers and system adminstrators, for the following use cases:
- viewing fares
- viewing system alerts (system wide, by station, by line)
- viewing schedules of trains and buses
- planning trips
- viewing all stops on a particular line

### Setup 

- install the open jdk version 25 for your OS
- mac or linux
- `brew install openjdk`

### Start Application

- unzip cta.zip to a directory a directory, eg './cta'
- from './cta'
- `java -cp .:mysql-connector-java.jar CTAClient`