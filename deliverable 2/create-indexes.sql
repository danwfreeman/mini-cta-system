
-- TimeTable is hit often index on all lookup fields
CREATE INDEX idx_timetable_lookup
  ON TimeTable (lineID, stationID, dayType, direction, timeOfDay);

-- StationLine is hit often for getting ordered stops by line
CREATE INDEX idx_stationline_line_sequence
  ON StationLine (lineID, stopSequence, stationID);


-- Alert are often queried by time range and severity
CREATE INDEX idx_alert_time
  ON Alert (startTime, endTime);

-- Alert are often queried by time range and severity
CREATE INDEX idx_alert_severity_time
  ON Alert (severity, startTime);

show index from TimeTable;

show index from StationLine;

show index from Alert;