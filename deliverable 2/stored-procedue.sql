
-- since we call this often to get the maps of the lines in the UI, we want to offload the ordering of the sequence to the database
DELIMITER $$

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

DELIMITER ;

-- use the stored procedure
CALL sp_get_ordered_line_stops_by_line_name('Red Line');