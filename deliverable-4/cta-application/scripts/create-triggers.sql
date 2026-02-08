DELIMITER $$

USE chicago_cta;

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


