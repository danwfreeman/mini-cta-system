-- get the day type for this system giving the current date
DELIMITER $$

CREATE FUNCTION fn_get_day_type(p_date DATE)
RETURNS ENUM('weekday','saturday','sunday_holiday')
DETERMINISTIC
BEGIN
  RETURN
    CASE
      WHEN DAYOFWEEK(p_date) BETWEEN 2 AND 6 THEN 'weekday'
      WHEN DAYOFWEEK(p_date) = 7 THEN 'saturday'
      ELSE 'sunday_holiday'
    END;
END$$

DELIMITER ;


-- use the function to get today's day type
SELECT
  tt.stationID,
  tt.timeOfDay
FROM TimeTable tt
WHERE tt.dayType = fn_get_day_type(CURDATE());

-- return the day type for now
select fn_get_day_type(CURDATE());

-- return 'saturday' for 2026-01-31
select fn_get_day_type('2026-01-31');



-- function to determine if a given time is in peak hours based on day type
-- return true or false for if peak time
-- defines peak hours as 7:00-9:00 and 16:00-18:00 on weekdays only

DELIMITER $$
CREATE FUNCTION fn_is_peak_time_by_day (
  p_time    TIME,
  p_dayType ENUM('weekday','saturday','sunday_holiday')
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
  IF p_dayType <> 'weekday' THEN
    RETURN FALSE;
  END IF;
  RETURN (
       (p_time >= '07:00:00' AND p_time < '09:00:00')
    OR (p_time >= '16:00:00' AND p_time < '18:00:00')
  );
END$$

DELIMITER ;

-- use isPeakTime in conjuction with getDayType
select fn_is_peak_time_by_day('08:30:00', fn_get_day_type('2024-07-01')); -- expect true (weekday peak)