-- Safe drop script for indexes in this project
-- Run with: mysql -u root -p chicago_cta < "deliverable 2/drop-indexes.sql"

-- 1) idx_timetable_lookup on TimeTable
SET @exists := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'TimeTable' AND index_name = 'idx_timetable_lookup'
);
SET @stmt := IF(@exists > 0, 'ALTER TABLE TimeTable DROP INDEX idx_timetable_lookup;', 'SELECT "Index idx_timetable_lookup not found on TimeTable";');
PREPARE drop_stmt FROM @stmt;
EXECUTE drop_stmt;
DEALLOCATE PREPARE drop_stmt;

-- 2) idx_stationline_line_sequence on StationLine
SET @exists := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'StationLine' AND index_name = 'idx_stationline_line_sequence'
);
SET @stmt := IF(@exists > 0, 'ALTER TABLE StationLine DROP INDEX idx_stationline_line_sequence;', 'SELECT "Index idx_stationline_line_sequence not found on StationLine";');
PREPARE drop_stmt FROM @stmt;
EXECUTE drop_stmt;
DEALLOCATE PREPARE drop_stmt;

-- 3) idx_alert_time on Alert
SET @exists := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'Alert' AND index_name = 'idx_alert_time'
);
SET @stmt := IF(@exists > 0, 'ALTER TABLE Alert DROP INDEX idx_alert_time;', 'SELECT "Index idx_alert_time not found on Alert";');
PREPARE drop_stmt FROM @stmt;
EXECUTE drop_stmt;
DEALLOCATE PREPARE drop_stmt;

-- 4) idx_alert_severity_time on Alert
SET @exists := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'Alert' AND index_name = 'idx_alert_severity_time'
);
SET @stmt := IF(@exists > 0, 'ALTER TABLE Alert DROP INDEX idx_alert_severity_time;', 'SELECT "Index idx_alert_severity_time not found on Alert";');
PREPARE drop_stmt FROM @stmt;
EXECUTE drop_stmt;
DEALLOCATE PREPARE drop_stmt;

-- Done
SELECT 'done' AS status;