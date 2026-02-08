USE chicago_cta;

-- Drop in FK dependency order
DROP TABLE IF EXISTS AlertStation;
DROP TABLE IF EXISTS AlertLine;
DROP TABLE IF EXISTS TimeTable;
DROP TABLE IF EXISTS StationLine;
DROP TABLE IF EXISTS Alert;
DROP TABLE IF EXISTS Fare;
DROP TABLE IF EXISTS Station;
DROP TABLE IF EXISTS Line;


-- Line
CREATE TABLE Line (
  lineID INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  mode ENUM('bus','train'),
  PRIMARY KEY (lineID)
);


-- Station
CREATE TABLE Station (
  stationID INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(150),
  mode ENUM('bus','train'),
  isAccessible BOOLEAN,
  PRIMARY KEY (stationID)
);


-- StationLine (join table)
CREATE TABLE StationLine (
  stationID INT NOT NULL,
  lineID INT NOT NULL,
  stopSequence SMALLINT NOT NULL,
  PRIMARY KEY (stationID, lineID),
  UNIQUE KEY uq_stationline_line_sequence (lineID, stopSequence),
  CONSTRAINT fk_stationline_station
    FOREIGN KEY (stationID) REFERENCES Station(stationID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_stationline_line
    FOREIGN KEY (lineID) REFERENCES Line(lineID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


-- TimeTable
CREATE TABLE TimeTable (
  timetableID INT NOT NULL AUTO_INCREMENT,
  lineID INT NOT NULL,
  stationID INT NOT NULL,
  dayType ENUM('weekday','saturday','sunday_holiday'),
  timeOfDay TIME NOT NULL,
  direction ENUM('northbound','southbound','eastbound','westbound'),
  PRIMARY KEY (timetableID),
  UNIQUE KEY uq_timetable_line_station_day_dir_time (lineID, stationID, dayType, direction, timeOfDay),
  CONSTRAINT fk_timetable_line
    FOREIGN KEY (lineID) REFERENCES Line(lineID)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT fk_timetable_station
    FOREIGN KEY (stationID) REFERENCES Station(stationID)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);


-- Fare
CREATE TABLE Fare (
  fareID INT NOT NULL AUTO_INCREMENT,
  fareCategory VARCHAR(60),
  riderCategory ENUM('regular','reduced','student'),
  price DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (fareID)
);


-- Alert
CREATE TABLE Alert (
  alertID INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(150),
  description TEXT NOT NULL,
  startTime DATETIME NOT NULL,
  endTime DATETIME NOT NULL,
  severity ENUM('info','minor','major','critical'),
  PRIMARY KEY (alertID)
);


-- AlertLine (join table)
CREATE TABLE AlertLine (
  alertID INT NOT NULL ,
  lineID INT NOT NULL,
  PRIMARY KEY (alertID, lineID),
  CONSTRAINT fk_alertline_alert
    FOREIGN KEY (alertID) REFERENCES Alert(alertID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_alertline_line
    FOREIGN KEY (lineID) REFERENCES Line(lineID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


-- AlertStation (join table)
CREATE TABLE AlertStation (
  alertID INT NOT NULL,
  stationID INT NOT NULL,
  PRIMARY KEY (alertID, stationID),
  CONSTRAINT fk_alertstation_alert
    FOREIGN KEY (alertID) REFERENCES Alert(alertID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_alertstation_station
    FOREIGN KEY (stationID) REFERENCES Station(stationID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
