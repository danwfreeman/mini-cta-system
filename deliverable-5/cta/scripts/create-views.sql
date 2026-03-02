USE chicago_cta;


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


-- Transfer hubs (stations served by both train and bus, uses INTERSECT set operation)
CREATE OR REPLACE VIEW v_transfer_hubs AS
SELECT s.name, GROUP_CONCAT(DISTINCT l.name ORDER BY l.name SEPARATOR ', ') AS linesNames
FROM Station s
JOIN StationLine sl ON sl.stationID = s.stationID
JOIN Line l ON l.lineID = sl.lineID
WHERE s.name IN (
    SELECT s1.name FROM Station s1
    JOIN StationLine sl1 ON sl1.stationID = s1.stationID
    JOIN Line l1 ON l1.lineID = sl1.lineID WHERE l1.mode = 'train'

    INTERSECT

    SELECT s2.name FROM Station s2
    JOIN StationLine sl2 ON sl2.stationID = s2.stationID
    JOIN Line l2 ON l2.lineID = sl2.lineID WHERE l2.mode = 'bus'
)
GROUP BY s.name;


-- Lines with the most accessible stations (set comparison using >= ALL)
CREATE OR REPLACE VIEW v_most_accessible_lines AS
SELECT l.lineID, l.name, COUNT(*) AS accessibleCount,
       GROUP_CONCAT(DISTINCT s.name ORDER BY s.name SEPARATOR ', ') AS accessibleStations
FROM Line l
JOIN StationLine sl ON sl.lineID = l.lineID
JOIN Station s ON s.stationID = sl.stationID
WHERE s.isAccessible = TRUE
GROUP BY l.lineID, l.name
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM Line l2
    JOIN StationLine sl2 ON sl2.lineID = l2.lineID
    JOIN Station s2 ON s2.stationID = sl2.stationID
    WHERE s2.isAccessible = TRUE
    GROUP BY l2.lineID
);
