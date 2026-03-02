USE chicago_cta;
-- since we call this often to get the maps of the lines in the UI, we want to offload the ordering of the sequence to the database
DELIMITER $$

DROP PROCEDURE IF EXISTS sp_get_ordered_line_stops_by_line_name$$
CREATE PROCEDURE sp_get_ordered_line_stops_by_line_name (
  IN p_lineName VARCHAR(100)
)
BEGIN
  SELECT
    l.lineID,
    l.name AS lineName,
    l.mode AS lineMode,
    sl.stopSequence,
    s.stationID,
    s.name AS stationName,
    s.isAccessible
  FROM Line l
  JOIN StationLine sl ON sl.lineID = l.lineID
  JOIN Station s      ON s.stationID = sl.stationID
  WHERE l.name = p_lineName
  ORDER BY sl.stopSequence;
END$$



DROP PROCEDURE IF EXISTS sp_get_trip_schedule$$
CREATE PROCEDURE sp_get_trip_schedule (
  IN p_lineName VARCHAR(100),
  IN p_startStation VARCHAR(100),
  IN p_endStation VARCHAR(100),
  IN p_dayType VARCHAR(20),
  IN p_direction VARCHAR(20)
)
BEGIN
  WITH start_times AS (
    SELECT
      tt.timeOfDay AS departTime,
      ROW_NUMBER() OVER (ORDER BY tt.timeOfDay) AS rn
    FROM TimeTable tt
    JOIN Line l    ON l.lineID = tt.lineID
    JOIN Station s ON s.stationID = tt.stationID
    WHERE l.name = p_lineName
      AND s.name = p_startStation
      AND tt.dayType = p_dayType
      AND tt.direction = p_direction
  ),
  end_times AS (
    SELECT
      tt.timeOfDay AS arriveTime,
      ROW_NUMBER() OVER (ORDER BY tt.timeOfDay) AS rn
    FROM TimeTable tt
    JOIN Line l    ON l.lineID = tt.lineID
    JOIN Station s ON s.stationID = tt.stationID
    WHERE l.name = p_lineName
      AND s.name = p_endStation
      AND tt.dayType = p_dayType
      AND tt.direction = p_direction
  )
  SELECT
    st.rn AS tripNumber,
    st.departTime,
    et.arriveTime,
    TIMESTAMPDIFF(MINUTE, st.departTime, et.arriveTime) AS tripDurationMinutes
  FROM start_times st
  JOIN end_times et ON et.rn = st.rn
  WHERE et.arriveTime > st.departTime
  ORDER BY st.rn;
END$$


-- OLAP query: average, min, max trip duration between two stations on a line
-- uses WITH clause (CTE), ROW_NUMBER() window function, and aggregate functions
DROP PROCEDURE IF EXISTS sp_get_trip_stats$$
CREATE PROCEDURE sp_get_trip_stats (
  IN p_lineName VARCHAR(100),
  IN p_startStation VARCHAR(100),
  IN p_endStation VARCHAR(100),
  IN p_dayType VARCHAR(20),
  IN p_direction VARCHAR(20)
)
BEGIN
  WITH start_times AS (
    SELECT
      tt.timeOfDay AS departTime,
      ROW_NUMBER() OVER (ORDER BY tt.timeOfDay) AS rn
    FROM TimeTable tt
    JOIN Line l    ON l.lineID = tt.lineID
    JOIN Station s ON s.stationID = tt.stationID
    WHERE l.name = p_lineName
      AND s.name = p_startStation
      AND tt.dayType = p_dayType
      AND tt.direction = p_direction
  ),
  end_times AS (
    SELECT
      tt.timeOfDay AS arriveTime,
      ROW_NUMBER() OVER (ORDER BY tt.timeOfDay) AS rn
    FROM TimeTable tt
    JOIN Line l    ON l.lineID = tt.lineID
    JOIN Station s ON s.stationID = tt.stationID
    WHERE l.name = p_lineName
      AND s.name = p_endStation
      AND tt.dayType = p_dayType
      AND tt.direction = p_direction
  ),
  trip_durations AS (
    SELECT
      TIMESTAMPDIFF(MINUTE, st.departTime, et.arriveTime) AS tripMinutes
    FROM start_times st
    JOIN end_times et ON et.rn = st.rn
    WHERE et.arriveTime > st.departTime
  )
  SELECT
    AVG(tripMinutes) AS avgTripMinutes,
    MIN(tripMinutes) AS minTripMinutes,
    MAX(tripMinutes) AS maxTripMinutes
  FROM trip_durations;
END$$


-- Find a direct route: a line that serves both start and end stations
-- Uses relational division pattern with GROUP BY and HAVING COUNT(DISTINCT) = 2
DROP PROCEDURE IF EXISTS sp_find_direct_route$$
CREATE PROCEDURE sp_find_direct_route (
  IN p_startStation VARCHAR(100),
  IN p_endStation VARCHAR(100)
)
BEGIN
  SELECT l.name AS lineName
  FROM Line l
  JOIN StationLine sl ON sl.lineID = l.lineID
  JOIN Station s ON s.stationID = sl.stationID
  WHERE s.name IN (p_startStation, p_endStation)
  GROUP BY l.lineID, l.name
  HAVING COUNT(DISTINCT s.name) = 2;
END$$


-- Find a one-transfer route between two stations via a shared transfer station
-- Uses set membership (IN subquery) to find lines serving each station
DROP PROCEDURE IF EXISTS sp_find_transfer_route$$
CREATE PROCEDURE sp_find_transfer_route (
  IN p_startStation VARCHAR(100),
  IN p_endStation VARCHAR(100)
)
BEGIN
  SELECT DISTINCT s.name AS transferStation, l1.name AS takeLine, l2.name AS transferToLine
  FROM Station s
  JOIN StationLine slA ON slA.stationID = s.stationID
  JOIN StationLine slB ON slB.stationID = s.stationID
  JOIN Line l1 ON l1.lineID = slA.lineID
  JOIN Line l2 ON l2.lineID = slB.lineID
  WHERE slA.lineID IN (
      SELECT sl.lineID FROM StationLine sl
      JOIN Station st ON st.stationID = sl.stationID WHERE st.name = p_startStation
  )
  AND slB.lineID IN (
      SELECT sl.lineID FROM StationLine sl
      JOIN Station st ON st.stationID = sl.stationID WHERE st.name = p_endStation
  )
  AND slA.lineID <> slB.lineID
  AND s.name NOT IN (p_startStation, p_endStation);
END$$

DELIMITER ;
