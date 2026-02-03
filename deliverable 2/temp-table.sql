
-- create time-based temporary table for active alerts
CREATE TEMPORARY TABLE tmp_active_alerts (
  alertID   INT PRIMARY KEY,
  lineID    INT,
  stationID INT,
  severity  ENUM('info','minor','major','critical')
);


-- populate temp table with time based active alerts based on the current time
INSERT INTO tmp_active_alerts (alertID, lineID, stationID, severity)
SELECT
  a.alertID,
  al.lineID,
  ast.stationID,
  a.severity
FROM Alert a
LEFT JOIN AlertLine al     ON al.alertID = a.alertID
LEFT JOIN AlertStation ast ON ast.alertID = a.alertID
WHERE NOW() BETWEEN a.startTime AND a.endTime;

-- query for getting all weekday times for the blue line stations that do not have active alerts for today
-- time based queries are 'baked in' via the temporary table and evaluated once only
SELECT
  l.name AS lineName,
  s.name AS stationName,
  tt.direction,
  tt.timeOfDay
FROM TimeTable tt
JOIN Line l  ON l.lineID = tt.lineID
JOIN Station s ON s.stationID = tt.stationID
LEFT JOIN tmp_active_alerts ta
  ON ta.lineID = tt.lineID  OR ta.stationID = tt.stationID
WHERE l.name = 'Blue Line'  AND tt.dayType = 'weekday'  AND ta.alertID IS NULL
ORDER BY s.name, tt.direction, tt.timeOfDay;