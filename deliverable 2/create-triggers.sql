DELIMITER $$

CREATE TRIGGER trg_alert_validate_time_before_insert
BEFORE INSERT ON Alert
FOR EACH ROW
BEGIN
  IF NEW.endTime <= NEW.startTime THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Alert endTime must be after startTime';
  END IF;
END$$

DELIMITER ;


-- show that the triggers was created
show triggers;


-- show trigger being triggered
INSERT INTO Alert (
  alertID,
  title,
  description,
  startTime,
  endTime,
  severity
) VALUES (
  9999,
  'Test Invalid Alert',
  'This alert has an end time that is before the start time.',
  '2026-01-25 10:00:00',
  '2026-01-25 09:00:00',   -- endTime is before the startTime
  'major'
);