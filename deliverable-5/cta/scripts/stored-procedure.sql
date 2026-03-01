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

DROP PROCEDURE IF EXISTS sp_get_window_wait_times$$
CREATE PROCEDURE sp_get_window_wait_times (
  IN p_lineName VARCHAR(100),
  IN p_stationName VARCHAR(100),
  IN p_dayType VARCHAR(20),
  IN p_direction VARCHAR(20),
  IN p_startTime TIME,
  IN p_endTime TIME
)
BEGIN
  SELECT
    t.lineName,
    t.stationName,
    t.dayType,
    t.direction,
    t.arrivalTime,
    t.nextArrivalTime,
    t.minutesUntilNext
  FROM (
    SELECT
      l.name AS lineName,
      s.name AS stationName,
      tt.dayType,
      tt.direction,
      tt.timeOfDay AS arrivalTime,
      LEAD(tt.timeOfDay) OVER (
        PARTITION BY tt.lineID, tt.stationID, tt.dayType, tt.direction
        ORDER BY tt.timeOfDay
      ) AS nextArrivalTime,
      TIMESTAMPDIFF(
        MINUTE,
        tt.timeOfDay,
        LEAD(tt.timeOfDay) OVER (
          PARTITION BY tt.lineID, tt.stationID, tt.dayType, tt.direction
          ORDER BY tt.timeOfDay
        )
      ) AS minutesUntilNext
    FROM TimeTable tt
    JOIN Line l    ON l.lineID = tt.lineID
    JOIN Station s ON s.stationID = tt.stationID
    WHERE l.name = p_lineName
      AND s.name = p_stationName
      AND tt.dayType = p_dayType
      AND tt.direction = p_direction
      AND tt.timeOfDay >= p_startTime
      AND tt.timeOfDay < p_endTime
  ) t
  WHERE t.nextArrivalTime IS NOT NULL
  ORDER BY t.arrivalTime;
END$$

DELIMITER ;
