USE chicago_cta;
-- Line schedules (line name + station name + time)

CREATE OR REPLACE VIEW v_line_schedule AS
SELECT
  l.lineID,
  l.name AS lineName,
  l.mode AS lineMode,
  tt.stationID,
  s.name AS stationName,
  tt.dayType,
  tt.direction,
  tt.timeOfDay
FROM TimeTable tt
JOIN Line l    ON l.lineID = tt.lineID
JOIN Station s ON s.stationID = tt.stationID;


-- Active alerts (right now)
CREATE OR REPLACE VIEW v_active_alerts AS
SELECT
  alertID,
  title,
  description,
  startTime,
  endTime,
  severity
FROM Alert
WHERE NOW() BETWEEN startTime AND endTime;

-- Alerts by line (line name + alert details)
CREATE OR REPLACE VIEW v_alerts_by_line AS
SELECT
  l.lineID,
  l.name AS lineName,
  a.alertID,
  a.title,
  a.description,
  a.severity,
  a.startTime,
  a.endTime
FROM AlertLine al
JOIN Line  l ON l.lineID = al.lineID
JOIN Alert a ON a.alertID = al.alertID;

-- Alerts by station (station name + alert details)
CREATE OR REPLACE VIEW v_alerts_by_station AS
SELECT
  s.stationID,
  s.name AS stationName,
  a.alertID,
  a.title,
  a.description,
  a.severity,
  a.startTime,
  a.endTime
FROM AlertStation ast
JOIN Station s ON s.stationID = ast.stationID
JOIN Alert   a ON a.alertID = ast.alertID;

-- Line stops - ordered (line name + station name + accessibility)
CREATE OR REPLACE VIEW v_line_stops AS
SELECT
  l.lineID,
  l.name AS lineName,
  sl.stopSequence,
  s.stationID,
  s.name AS stationName,
  s.isAccessible
FROM StationLine sl
JOIN Line l    ON l.lineID = sl.lineID
JOIN Station s ON s.stationID = sl.stationID;

