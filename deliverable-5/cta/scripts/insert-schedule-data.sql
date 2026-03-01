USE chicago_cta;
-- TimeTable seed data
-- Times increase with stopSequence: +5 min per stop along each line
-- 10 weekday, 3 sunday_holiday, 2 saturday entries per station, all northbound


-- Red Line (1) - northbound
-- Red Line @ Howard (1001) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50001, 1, 1001, 'weekday', '06:00:00', 'northbound'),
(50002, 1, 1001, 'weekday', '06:08:00', 'northbound'),
(50003, 1, 1001, 'weekday', '06:16:00', 'northbound'),
(50004, 1, 1001, 'weekday', '06:24:00', 'northbound'),
(50005, 1, 1001, 'weekday', '06:32:00', 'northbound'),
(50006, 1, 1001, 'weekday', '06:40:00', 'northbound'),
(50007, 1, 1001, 'weekday', '06:48:00', 'northbound'),
(50008, 1, 1001, 'weekday', '06:56:00', 'northbound'),
(50009, 1, 1001, 'weekday', '07:04:00', 'northbound'),
(50010, 1, 1001, 'weekday', '07:12:00', 'northbound');
-- Red Line @ Howard (1001) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50011, 1, 1001, 'sunday_holiday', '10:00:00', 'northbound'),
(50012, 1, 1001, 'sunday_holiday', '10:20:00', 'northbound'),
(50013, 1, 1001, 'sunday_holiday', '10:40:00', 'northbound');
-- Red Line @ Howard (1001) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50014, 1, 1001, 'saturday', '09:00:00', 'northbound'),
(50015, 1, 1001, 'saturday', '09:20:00', 'northbound');
-- Red Line @ Belmont (1002) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50016, 1, 1002, 'weekday', '06:05:00', 'northbound'),
(50017, 1, 1002, 'weekday', '06:13:00', 'northbound'),
(50018, 1, 1002, 'weekday', '06:21:00', 'northbound'),
(50019, 1, 1002, 'weekday', '06:29:00', 'northbound'),
(50020, 1, 1002, 'weekday', '06:37:00', 'northbound'),
(50021, 1, 1002, 'weekday', '06:45:00', 'northbound'),
(50022, 1, 1002, 'weekday', '06:53:00', 'northbound'),
(50023, 1, 1002, 'weekday', '07:01:00', 'northbound'),
(50024, 1, 1002, 'weekday', '07:09:00', 'northbound'),
(50025, 1, 1002, 'weekday', '07:17:00', 'northbound');
-- Red Line @ Belmont (1002) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50026, 1, 1002, 'sunday_holiday', '10:05:00', 'northbound'),
(50027, 1, 1002, 'sunday_holiday', '10:25:00', 'northbound'),
(50028, 1, 1002, 'sunday_holiday', '10:45:00', 'northbound');
-- Red Line @ Belmont (1002) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50029, 1, 1002, 'saturday', '09:05:00', 'northbound'),
(50030, 1, 1002, 'saturday', '09:25:00', 'northbound');
-- Red Line @ Fullerton (1003) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50031, 1, 1003, 'weekday', '06:10:00', 'northbound'),
(50032, 1, 1003, 'weekday', '06:18:00', 'northbound'),
(50033, 1, 1003, 'weekday', '06:26:00', 'northbound'),
(50034, 1, 1003, 'weekday', '06:34:00', 'northbound'),
(50035, 1, 1003, 'weekday', '06:42:00', 'northbound'),
(50036, 1, 1003, 'weekday', '06:50:00', 'northbound'),
(50037, 1, 1003, 'weekday', '06:58:00', 'northbound'),
(50038, 1, 1003, 'weekday', '07:06:00', 'northbound'),
(50039, 1, 1003, 'weekday', '07:14:00', 'northbound'),
(50040, 1, 1003, 'weekday', '07:22:00', 'northbound');
-- Red Line @ Fullerton (1003) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50041, 1, 1003, 'sunday_holiday', '10:10:00', 'northbound'),
(50042, 1, 1003, 'sunday_holiday', '10:30:00', 'northbound'),
(50043, 1, 1003, 'sunday_holiday', '10:50:00', 'northbound');
-- Red Line @ Fullerton (1003) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50044, 1, 1003, 'saturday', '09:10:00', 'northbound'),
(50045, 1, 1003, 'saturday', '09:30:00', 'northbound');
-- Red Line @ Jackson (1004) seq 4 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50046, 1, 1004, 'weekday', '06:15:00', 'northbound'),
(50047, 1, 1004, 'weekday', '06:23:00', 'northbound'),
(50048, 1, 1004, 'weekday', '06:31:00', 'northbound'),
(50049, 1, 1004, 'weekday', '06:39:00', 'northbound'),
(50050, 1, 1004, 'weekday', '06:47:00', 'northbound'),
(50051, 1, 1004, 'weekday', '06:55:00', 'northbound'),
(50052, 1, 1004, 'weekday', '07:03:00', 'northbound'),
(50053, 1, 1004, 'weekday', '07:11:00', 'northbound'),
(50054, 1, 1004, 'weekday', '07:19:00', 'northbound'),
(50055, 1, 1004, 'weekday', '07:27:00', 'northbound');
-- Red Line @ Jackson (1004) seq 4 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50056, 1, 1004, 'sunday_holiday', '10:15:00', 'northbound'),
(50057, 1, 1004, 'sunday_holiday', '10:35:00', 'northbound'),
(50058, 1, 1004, 'sunday_holiday', '10:55:00', 'northbound');
-- Red Line @ Jackson (1004) seq 4 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50059, 1, 1004, 'saturday', '09:15:00', 'northbound'),
(50060, 1, 1004, 'saturday', '09:35:00', 'northbound');
-- Red Line @ 95th/Dan Ryan (1008) seq 5 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50061, 1, 1008, 'weekday', '06:20:00', 'northbound'),
(50062, 1, 1008, 'weekday', '06:28:00', 'northbound'),
(50063, 1, 1008, 'weekday', '06:36:00', 'northbound'),
(50064, 1, 1008, 'weekday', '06:44:00', 'northbound'),
(50065, 1, 1008, 'weekday', '06:52:00', 'northbound'),
(50066, 1, 1008, 'weekday', '07:00:00', 'northbound'),
(50067, 1, 1008, 'weekday', '07:08:00', 'northbound'),
(50068, 1, 1008, 'weekday', '07:16:00', 'northbound'),
(50069, 1, 1008, 'weekday', '07:24:00', 'northbound'),
(50070, 1, 1008, 'weekday', '07:32:00', 'northbound');
-- Red Line @ 95th/Dan Ryan (1008) seq 5 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50071, 1, 1008, 'sunday_holiday', '10:20:00', 'northbound'),
(50072, 1, 1008, 'sunday_holiday', '10:40:00', 'northbound'),
(50073, 1, 1008, 'sunday_holiday', '11:00:00', 'northbound');
-- Red Line @ 95th/Dan Ryan (1008) seq 5 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50074, 1, 1008, 'saturday', '09:20:00', 'northbound'),
(50075, 1, 1008, 'saturday', '09:40:00', 'northbound');

-- Blue Line (2) - northbound
-- Blue Line @ O'Hare (1007) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50076, 2, 1007, 'weekday', '06:00:00', 'northbound'),
(50077, 2, 1007, 'weekday', '06:08:00', 'northbound'),
(50078, 2, 1007, 'weekday', '06:16:00', 'northbound'),
(50079, 2, 1007, 'weekday', '06:24:00', 'northbound'),
(50080, 2, 1007, 'weekday', '06:32:00', 'northbound'),
(50081, 2, 1007, 'weekday', '06:40:00', 'northbound'),
(50082, 2, 1007, 'weekday', '06:48:00', 'northbound'),
(50083, 2, 1007, 'weekday', '06:56:00', 'northbound'),
(50084, 2, 1007, 'weekday', '07:04:00', 'northbound'),
(50085, 2, 1007, 'weekday', '07:12:00', 'northbound');
-- Blue Line @ O'Hare (1007) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50086, 2, 1007, 'sunday_holiday', '10:00:00', 'northbound'),
(50087, 2, 1007, 'sunday_holiday', '10:20:00', 'northbound'),
(50088, 2, 1007, 'sunday_holiday', '10:40:00', 'northbound');
-- Blue Line @ O'Hare (1007) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50089, 2, 1007, 'saturday', '09:00:00', 'northbound'),
(50090, 2, 1007, 'saturday', '09:20:00', 'northbound');
-- Blue Line @ Clark/Lake (1006) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50091, 2, 1006, 'weekday', '06:05:00', 'northbound'),
(50092, 2, 1006, 'weekday', '06:13:00', 'northbound'),
(50093, 2, 1006, 'weekday', '06:21:00', 'northbound'),
(50094, 2, 1006, 'weekday', '06:29:00', 'northbound'),
(50095, 2, 1006, 'weekday', '06:37:00', 'northbound'),
(50096, 2, 1006, 'weekday', '06:45:00', 'northbound'),
(50097, 2, 1006, 'weekday', '06:53:00', 'northbound'),
(50098, 2, 1006, 'weekday', '07:01:00', 'northbound'),
(50099, 2, 1006, 'weekday', '07:09:00', 'northbound'),
(50100, 2, 1006, 'weekday', '07:17:00', 'northbound');
-- Blue Line @ Clark/Lake (1006) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50101, 2, 1006, 'sunday_holiday', '10:05:00', 'northbound'),
(50102, 2, 1006, 'sunday_holiday', '10:25:00', 'northbound'),
(50103, 2, 1006, 'sunday_holiday', '10:45:00', 'northbound');
-- Blue Line @ Clark/Lake (1006) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50104, 2, 1006, 'saturday', '09:05:00', 'northbound'),
(50105, 2, 1006, 'saturday', '09:25:00', 'northbound');
-- Blue Line @ Jackson (1004) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50106, 2, 1004, 'weekday', '06:10:00', 'northbound'),
(50107, 2, 1004, 'weekday', '06:18:00', 'northbound'),
(50108, 2, 1004, 'weekday', '06:26:00', 'northbound'),
(50109, 2, 1004, 'weekday', '06:34:00', 'northbound'),
(50110, 2, 1004, 'weekday', '06:42:00', 'northbound'),
(50111, 2, 1004, 'weekday', '06:50:00', 'northbound'),
(50112, 2, 1004, 'weekday', '06:58:00', 'northbound'),
(50113, 2, 1004, 'weekday', '07:06:00', 'northbound'),
(50114, 2, 1004, 'weekday', '07:14:00', 'northbound'),
(50115, 2, 1004, 'weekday', '07:22:00', 'northbound');
-- Blue Line @ Jackson (1004) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50116, 2, 1004, 'sunday_holiday', '10:10:00', 'northbound'),
(50117, 2, 1004, 'sunday_holiday', '10:30:00', 'northbound'),
(50118, 2, 1004, 'sunday_holiday', '10:50:00', 'northbound');
-- Blue Line @ Jackson (1004) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50119, 2, 1004, 'saturday', '09:10:00', 'northbound'),
(50120, 2, 1004, 'saturday', '09:30:00', 'northbound');

-- Brown Line (3) - northbound
-- Brown Line @ Belmont (1002) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50121, 3, 1002, 'weekday', '06:00:00', 'northbound'),
(50122, 3, 1002, 'weekday', '06:08:00', 'northbound'),
(50123, 3, 1002, 'weekday', '06:16:00', 'northbound'),
(50124, 3, 1002, 'weekday', '06:24:00', 'northbound'),
(50125, 3, 1002, 'weekday', '06:32:00', 'northbound'),
(50126, 3, 1002, 'weekday', '06:40:00', 'northbound'),
(50127, 3, 1002, 'weekday', '06:48:00', 'northbound'),
(50128, 3, 1002, 'weekday', '06:56:00', 'northbound'),
(50129, 3, 1002, 'weekday', '07:04:00', 'northbound'),
(50130, 3, 1002, 'weekday', '07:12:00', 'northbound');
-- Brown Line @ Belmont (1002) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50131, 3, 1002, 'sunday_holiday', '10:00:00', 'northbound'),
(50132, 3, 1002, 'sunday_holiday', '10:20:00', 'northbound'),
(50133, 3, 1002, 'sunday_holiday', '10:40:00', 'northbound');
-- Brown Line @ Belmont (1002) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50134, 3, 1002, 'saturday', '09:00:00', 'northbound'),
(50135, 3, 1002, 'saturday', '09:20:00', 'northbound');
-- Brown Line @ Fullerton (1003) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50136, 3, 1003, 'weekday', '06:05:00', 'northbound'),
(50137, 3, 1003, 'weekday', '06:13:00', 'northbound'),
(50138, 3, 1003, 'weekday', '06:21:00', 'northbound'),
(50139, 3, 1003, 'weekday', '06:29:00', 'northbound'),
(50140, 3, 1003, 'weekday', '06:37:00', 'northbound'),
(50141, 3, 1003, 'weekday', '06:45:00', 'northbound'),
(50142, 3, 1003, 'weekday', '06:53:00', 'northbound'),
(50143, 3, 1003, 'weekday', '07:01:00', 'northbound'),
(50144, 3, 1003, 'weekday', '07:09:00', 'northbound'),
(50145, 3, 1003, 'weekday', '07:17:00', 'northbound');
-- Brown Line @ Fullerton (1003) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50146, 3, 1003, 'sunday_holiday', '10:05:00', 'northbound'),
(50147, 3, 1003, 'sunday_holiday', '10:25:00', 'northbound'),
(50148, 3, 1003, 'sunday_holiday', '10:45:00', 'northbound');
-- Brown Line @ Fullerton (1003) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50149, 3, 1003, 'saturday', '09:05:00', 'northbound'),
(50150, 3, 1003, 'saturday', '09:25:00', 'northbound');
-- Brown Line @ Clark/Lake (1006) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50151, 3, 1006, 'weekday', '06:10:00', 'northbound'),
(50152, 3, 1006, 'weekday', '06:18:00', 'northbound'),
(50153, 3, 1006, 'weekday', '06:26:00', 'northbound'),
(50154, 3, 1006, 'weekday', '06:34:00', 'northbound'),
(50155, 3, 1006, 'weekday', '06:42:00', 'northbound'),
(50156, 3, 1006, 'weekday', '06:50:00', 'northbound'),
(50157, 3, 1006, 'weekday', '06:58:00', 'northbound'),
(50158, 3, 1006, 'weekday', '07:06:00', 'northbound'),
(50159, 3, 1006, 'weekday', '07:14:00', 'northbound'),
(50160, 3, 1006, 'weekday', '07:22:00', 'northbound');
-- Brown Line @ Clark/Lake (1006) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50161, 3, 1006, 'sunday_holiday', '10:10:00', 'northbound'),
(50162, 3, 1006, 'sunday_holiday', '10:30:00', 'northbound'),
(50163, 3, 1006, 'sunday_holiday', '10:50:00', 'northbound');
-- Brown Line @ Clark/Lake (1006) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50164, 3, 1006, 'saturday', '09:10:00', 'northbound'),
(50165, 3, 1006, 'saturday', '09:30:00', 'northbound');

-- Green Line (4) - northbound
-- Green Line @ Howard (1001) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50166, 4, 1001, 'weekday', '06:00:00', 'northbound'),
(50167, 4, 1001, 'weekday', '06:08:00', 'northbound'),
(50168, 4, 1001, 'weekday', '06:16:00', 'northbound'),
(50169, 4, 1001, 'weekday', '06:24:00', 'northbound'),
(50170, 4, 1001, 'weekday', '06:32:00', 'northbound'),
(50171, 4, 1001, 'weekday', '06:40:00', 'northbound'),
(50172, 4, 1001, 'weekday', '06:48:00', 'northbound'),
(50173, 4, 1001, 'weekday', '06:56:00', 'northbound'),
(50174, 4, 1001, 'weekday', '07:04:00', 'northbound'),
(50175, 4, 1001, 'weekday', '07:12:00', 'northbound');
-- Green Line @ Howard (1001) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50176, 4, 1001, 'sunday_holiday', '10:00:00', 'northbound'),
(50177, 4, 1001, 'sunday_holiday', '10:20:00', 'northbound'),
(50178, 4, 1001, 'sunday_holiday', '10:40:00', 'northbound');
-- Green Line @ Howard (1001) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50179, 4, 1001, 'saturday', '09:00:00', 'northbound'),
(50180, 4, 1001, 'saturday', '09:20:00', 'northbound');
-- Green Line @ Clark/Lake (1006) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50181, 4, 1006, 'weekday', '06:05:00', 'northbound'),
(50182, 4, 1006, 'weekday', '06:13:00', 'northbound'),
(50183, 4, 1006, 'weekday', '06:21:00', 'northbound'),
(50184, 4, 1006, 'weekday', '06:29:00', 'northbound'),
(50185, 4, 1006, 'weekday', '06:37:00', 'northbound'),
(50186, 4, 1006, 'weekday', '06:45:00', 'northbound'),
(50187, 4, 1006, 'weekday', '06:53:00', 'northbound'),
(50188, 4, 1006, 'weekday', '07:01:00', 'northbound'),
(50189, 4, 1006, 'weekday', '07:09:00', 'northbound'),
(50190, 4, 1006, 'weekday', '07:17:00', 'northbound');
-- Green Line @ Clark/Lake (1006) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50191, 4, 1006, 'sunday_holiday', '10:05:00', 'northbound'),
(50192, 4, 1006, 'sunday_holiday', '10:25:00', 'northbound'),
(50193, 4, 1006, 'sunday_holiday', '10:45:00', 'northbound');
-- Green Line @ Clark/Lake (1006) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50194, 4, 1006, 'saturday', '09:05:00', 'northbound'),
(50195, 4, 1006, 'saturday', '09:25:00', 'northbound');
-- Green Line @ Roosevelt (1005) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50196, 4, 1005, 'weekday', '06:10:00', 'northbound'),
(50197, 4, 1005, 'weekday', '06:18:00', 'northbound'),
(50198, 4, 1005, 'weekday', '06:26:00', 'northbound'),
(50199, 4, 1005, 'weekday', '06:34:00', 'northbound'),
(50200, 4, 1005, 'weekday', '06:42:00', 'northbound'),
(50201, 4, 1005, 'weekday', '06:50:00', 'northbound'),
(50202, 4, 1005, 'weekday', '06:58:00', 'northbound'),
(50203, 4, 1005, 'weekday', '07:06:00', 'northbound'),
(50204, 4, 1005, 'weekday', '07:14:00', 'northbound'),
(50205, 4, 1005, 'weekday', '07:22:00', 'northbound');
-- Green Line @ Roosevelt (1005) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50206, 4, 1005, 'sunday_holiday', '10:10:00', 'northbound'),
(50207, 4, 1005, 'sunday_holiday', '10:30:00', 'northbound'),
(50208, 4, 1005, 'sunday_holiday', '10:50:00', 'northbound');
-- Green Line @ Roosevelt (1005) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50209, 4, 1005, 'saturday', '09:10:00', 'northbound'),
(50210, 4, 1005, 'saturday', '09:30:00', 'northbound');

-- Orange Line (5) - northbound
-- Orange Line @ Roosevelt (1005) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50211, 5, 1005, 'weekday', '06:00:00', 'northbound'),
(50212, 5, 1005, 'weekday', '06:08:00', 'northbound'),
(50213, 5, 1005, 'weekday', '06:16:00', 'northbound'),
(50214, 5, 1005, 'weekday', '06:24:00', 'northbound'),
(50215, 5, 1005, 'weekday', '06:32:00', 'northbound'),
(50216, 5, 1005, 'weekday', '06:40:00', 'northbound'),
(50217, 5, 1005, 'weekday', '06:48:00', 'northbound'),
(50218, 5, 1005, 'weekday', '06:56:00', 'northbound'),
(50219, 5, 1005, 'weekday', '07:04:00', 'northbound'),
(50220, 5, 1005, 'weekday', '07:12:00', 'northbound');
-- Orange Line @ Roosevelt (1005) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50221, 5, 1005, 'sunday_holiday', '10:00:00', 'northbound'),
(50222, 5, 1005, 'sunday_holiday', '10:20:00', 'northbound'),
(50223, 5, 1005, 'sunday_holiday', '10:40:00', 'northbound');
-- Orange Line @ Roosevelt (1005) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50224, 5, 1005, 'saturday', '09:00:00', 'northbound'),
(50225, 5, 1005, 'saturday', '09:20:00', 'northbound');
-- Orange Line @ Cermak-Chinatown (1009) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50226, 5, 1009, 'weekday', '06:05:00', 'northbound'),
(50227, 5, 1009, 'weekday', '06:13:00', 'northbound'),
(50228, 5, 1009, 'weekday', '06:21:00', 'northbound'),
(50229, 5, 1009, 'weekday', '06:29:00', 'northbound'),
(50230, 5, 1009, 'weekday', '06:37:00', 'northbound'),
(50231, 5, 1009, 'weekday', '06:45:00', 'northbound'),
(50232, 5, 1009, 'weekday', '06:53:00', 'northbound'),
(50233, 5, 1009, 'weekday', '07:01:00', 'northbound'),
(50234, 5, 1009, 'weekday', '07:09:00', 'northbound'),
(50235, 5, 1009, 'weekday', '07:17:00', 'northbound');
-- Orange Line @ Cermak-Chinatown (1009) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50236, 5, 1009, 'sunday_holiday', '10:05:00', 'northbound'),
(50237, 5, 1009, 'sunday_holiday', '10:25:00', 'northbound'),
(50238, 5, 1009, 'sunday_holiday', '10:45:00', 'northbound');
-- Orange Line @ Cermak-Chinatown (1009) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50239, 5, 1009, 'saturday', '09:05:00', 'northbound'),
(50240, 5, 1009, 'saturday', '09:25:00', 'northbound');
-- Orange Line @ Sox-35th (1010) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50241, 5, 1010, 'weekday', '06:10:00', 'northbound'),
(50242, 5, 1010, 'weekday', '06:18:00', 'northbound'),
(50243, 5, 1010, 'weekday', '06:26:00', 'northbound'),
(50244, 5, 1010, 'weekday', '06:34:00', 'northbound'),
(50245, 5, 1010, 'weekday', '06:42:00', 'northbound'),
(50246, 5, 1010, 'weekday', '06:50:00', 'northbound'),
(50247, 5, 1010, 'weekday', '06:58:00', 'northbound'),
(50248, 5, 1010, 'weekday', '07:06:00', 'northbound'),
(50249, 5, 1010, 'weekday', '07:14:00', 'northbound'),
(50250, 5, 1010, 'weekday', '07:22:00', 'northbound');
-- Orange Line @ Sox-35th (1010) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50251, 5, 1010, 'sunday_holiday', '10:10:00', 'northbound'),
(50252, 5, 1010, 'sunday_holiday', '10:30:00', 'northbound'),
(50253, 5, 1010, 'sunday_holiday', '10:50:00', 'northbound');
-- Orange Line @ Sox-35th (1010) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50254, 5, 1010, 'saturday', '09:10:00', 'northbound'),
(50255, 5, 1010, 'saturday', '09:30:00', 'northbound');

-- Purple Line (6) - northbound
-- Purple Line @ Howard (1001) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50256, 6, 1001, 'weekday', '06:00:00', 'northbound'),
(50257, 6, 1001, 'weekday', '06:08:00', 'northbound'),
(50258, 6, 1001, 'weekday', '06:16:00', 'northbound'),
(50259, 6, 1001, 'weekday', '06:24:00', 'northbound'),
(50260, 6, 1001, 'weekday', '06:32:00', 'northbound'),
(50261, 6, 1001, 'weekday', '06:40:00', 'northbound'),
(50262, 6, 1001, 'weekday', '06:48:00', 'northbound'),
(50263, 6, 1001, 'weekday', '06:56:00', 'northbound'),
(50264, 6, 1001, 'weekday', '07:04:00', 'northbound'),
(50265, 6, 1001, 'weekday', '07:12:00', 'northbound');
-- Purple Line @ Howard (1001) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50266, 6, 1001, 'sunday_holiday', '10:00:00', 'northbound'),
(50267, 6, 1001, 'sunday_holiday', '10:20:00', 'northbound'),
(50268, 6, 1001, 'sunday_holiday', '10:40:00', 'northbound');
-- Purple Line @ Howard (1001) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50269, 6, 1001, 'saturday', '09:00:00', 'northbound'),
(50270, 6, 1001, 'saturday', '09:20:00', 'northbound');
-- Purple Line @ Belmont (1002) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50271, 6, 1002, 'weekday', '06:05:00', 'northbound'),
(50272, 6, 1002, 'weekday', '06:13:00', 'northbound'),
(50273, 6, 1002, 'weekday', '06:21:00', 'northbound'),
(50274, 6, 1002, 'weekday', '06:29:00', 'northbound'),
(50275, 6, 1002, 'weekday', '06:37:00', 'northbound'),
(50276, 6, 1002, 'weekday', '06:45:00', 'northbound'),
(50277, 6, 1002, 'weekday', '06:53:00', 'northbound'),
(50278, 6, 1002, 'weekday', '07:01:00', 'northbound'),
(50279, 6, 1002, 'weekday', '07:09:00', 'northbound'),
(50280, 6, 1002, 'weekday', '07:17:00', 'northbound');
-- Purple Line @ Belmont (1002) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50281, 6, 1002, 'sunday_holiday', '10:05:00', 'northbound'),
(50282, 6, 1002, 'sunday_holiday', '10:25:00', 'northbound'),
(50283, 6, 1002, 'sunday_holiday', '10:45:00', 'northbound');
-- Purple Line @ Belmont (1002) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50284, 6, 1002, 'saturday', '09:05:00', 'northbound'),
(50285, 6, 1002, 'saturday', '09:25:00', 'northbound');
-- Purple Line @ Fullerton (1003) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50286, 6, 1003, 'weekday', '06:10:00', 'northbound'),
(50287, 6, 1003, 'weekday', '06:18:00', 'northbound'),
(50288, 6, 1003, 'weekday', '06:26:00', 'northbound'),
(50289, 6, 1003, 'weekday', '06:34:00', 'northbound'),
(50290, 6, 1003, 'weekday', '06:42:00', 'northbound'),
(50291, 6, 1003, 'weekday', '06:50:00', 'northbound'),
(50292, 6, 1003, 'weekday', '06:58:00', 'northbound'),
(50293, 6, 1003, 'weekday', '07:06:00', 'northbound'),
(50294, 6, 1003, 'weekday', '07:14:00', 'northbound'),
(50295, 6, 1003, 'weekday', '07:22:00', 'northbound');
-- Purple Line @ Fullerton (1003) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50296, 6, 1003, 'sunday_holiday', '10:10:00', 'northbound'),
(50297, 6, 1003, 'sunday_holiday', '10:30:00', 'northbound'),
(50298, 6, 1003, 'sunday_holiday', '10:50:00', 'northbound');
-- Purple Line @ Fullerton (1003) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50299, 6, 1003, 'saturday', '09:10:00', 'northbound'),
(50300, 6, 1003, 'saturday', '09:30:00', 'northbound');

-- Pink Line (7) - northbound
-- Pink Line @ Fullerton (1003) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50301, 7, 1003, 'weekday', '06:00:00', 'northbound'),
(50302, 7, 1003, 'weekday', '06:08:00', 'northbound'),
(50303, 7, 1003, 'weekday', '06:16:00', 'northbound'),
(50304, 7, 1003, 'weekday', '06:24:00', 'northbound'),
(50305, 7, 1003, 'weekday', '06:32:00', 'northbound'),
(50306, 7, 1003, 'weekday', '06:40:00', 'northbound'),
(50307, 7, 1003, 'weekday', '06:48:00', 'northbound'),
(50308, 7, 1003, 'weekday', '06:56:00', 'northbound'),
(50309, 7, 1003, 'weekday', '07:04:00', 'northbound'),
(50310, 7, 1003, 'weekday', '07:12:00', 'northbound');
-- Pink Line @ Fullerton (1003) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50311, 7, 1003, 'sunday_holiday', '10:00:00', 'northbound'),
(50312, 7, 1003, 'sunday_holiday', '10:20:00', 'northbound'),
(50313, 7, 1003, 'sunday_holiday', '10:40:00', 'northbound');
-- Pink Line @ Fullerton (1003) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50314, 7, 1003, 'saturday', '09:00:00', 'northbound'),
(50315, 7, 1003, 'saturday', '09:20:00', 'northbound');
-- Pink Line @ Clark/Lake (1006) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50316, 7, 1006, 'weekday', '06:05:00', 'northbound'),
(50317, 7, 1006, 'weekday', '06:13:00', 'northbound'),
(50318, 7, 1006, 'weekday', '06:21:00', 'northbound'),
(50319, 7, 1006, 'weekday', '06:29:00', 'northbound'),
(50320, 7, 1006, 'weekday', '06:37:00', 'northbound'),
(50321, 7, 1006, 'weekday', '06:45:00', 'northbound'),
(50322, 7, 1006, 'weekday', '06:53:00', 'northbound'),
(50323, 7, 1006, 'weekday', '07:01:00', 'northbound'),
(50324, 7, 1006, 'weekday', '07:09:00', 'northbound'),
(50325, 7, 1006, 'weekday', '07:17:00', 'northbound');
-- Pink Line @ Clark/Lake (1006) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50326, 7, 1006, 'sunday_holiday', '10:05:00', 'northbound'),
(50327, 7, 1006, 'sunday_holiday', '10:25:00', 'northbound'),
(50328, 7, 1006, 'sunday_holiday', '10:45:00', 'northbound');
-- Pink Line @ Clark/Lake (1006) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50329, 7, 1006, 'saturday', '09:05:00', 'northbound'),
(50330, 7, 1006, 'saturday', '09:25:00', 'northbound');
-- Pink Line @ Roosevelt (1005) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50331, 7, 1005, 'weekday', '06:10:00', 'northbound'),
(50332, 7, 1005, 'weekday', '06:18:00', 'northbound'),
(50333, 7, 1005, 'weekday', '06:26:00', 'northbound'),
(50334, 7, 1005, 'weekday', '06:34:00', 'northbound'),
(50335, 7, 1005, 'weekday', '06:42:00', 'northbound'),
(50336, 7, 1005, 'weekday', '06:50:00', 'northbound'),
(50337, 7, 1005, 'weekday', '06:58:00', 'northbound'),
(50338, 7, 1005, 'weekday', '07:06:00', 'northbound'),
(50339, 7, 1005, 'weekday', '07:14:00', 'northbound'),
(50340, 7, 1005, 'weekday', '07:22:00', 'northbound');
-- Pink Line @ Roosevelt (1005) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50341, 7, 1005, 'sunday_holiday', '10:10:00', 'northbound'),
(50342, 7, 1005, 'sunday_holiday', '10:30:00', 'northbound'),
(50343, 7, 1005, 'sunday_holiday', '10:50:00', 'northbound');
-- Pink Line @ Roosevelt (1005) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50344, 7, 1005, 'saturday', '09:10:00', 'northbound'),
(50345, 7, 1005, 'saturday', '09:30:00', 'northbound');

-- Yellow Line (8) - northbound
-- Yellow Line @ Howard (1001) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50346, 8, 1001, 'weekday', '06:00:00', 'northbound'),
(50347, 8, 1001, 'weekday', '06:08:00', 'northbound'),
(50348, 8, 1001, 'weekday', '06:16:00', 'northbound'),
(50349, 8, 1001, 'weekday', '06:24:00', 'northbound'),
(50350, 8, 1001, 'weekday', '06:32:00', 'northbound'),
(50351, 8, 1001, 'weekday', '06:40:00', 'northbound'),
(50352, 8, 1001, 'weekday', '06:48:00', 'northbound'),
(50353, 8, 1001, 'weekday', '06:56:00', 'northbound'),
(50354, 8, 1001, 'weekday', '07:04:00', 'northbound'),
(50355, 8, 1001, 'weekday', '07:12:00', 'northbound');
-- Yellow Line @ Howard (1001) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50356, 8, 1001, 'sunday_holiday', '10:00:00', 'northbound'),
(50357, 8, 1001, 'sunday_holiday', '10:20:00', 'northbound'),
(50358, 8, 1001, 'sunday_holiday', '10:40:00', 'northbound');
-- Yellow Line @ Howard (1001) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50359, 8, 1001, 'saturday', '09:00:00', 'northbound'),
(50360, 8, 1001, 'saturday', '09:20:00', 'northbound');
-- Yellow Line @ Clark/Lake (1006) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50361, 8, 1006, 'weekday', '06:05:00', 'northbound'),
(50362, 8, 1006, 'weekday', '06:13:00', 'northbound'),
(50363, 8, 1006, 'weekday', '06:21:00', 'northbound'),
(50364, 8, 1006, 'weekday', '06:29:00', 'northbound'),
(50365, 8, 1006, 'weekday', '06:37:00', 'northbound'),
(50366, 8, 1006, 'weekday', '06:45:00', 'northbound'),
(50367, 8, 1006, 'weekday', '06:53:00', 'northbound'),
(50368, 8, 1006, 'weekday', '07:01:00', 'northbound'),
(50369, 8, 1006, 'weekday', '07:09:00', 'northbound'),
(50370, 8, 1006, 'weekday', '07:17:00', 'northbound');
-- Yellow Line @ Clark/Lake (1006) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50371, 8, 1006, 'sunday_holiday', '10:05:00', 'northbound'),
(50372, 8, 1006, 'sunday_holiday', '10:25:00', 'northbound'),
(50373, 8, 1006, 'sunday_holiday', '10:45:00', 'northbound');
-- Yellow Line @ Clark/Lake (1006) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50374, 8, 1006, 'saturday', '09:05:00', 'northbound'),
(50375, 8, 1006, 'saturday', '09:25:00', 'northbound');
-- Yellow Line @ Jackson (1004) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50376, 8, 1004, 'weekday', '06:10:00', 'northbound'),
(50377, 8, 1004, 'weekday', '06:18:00', 'northbound'),
(50378, 8, 1004, 'weekday', '06:26:00', 'northbound'),
(50379, 8, 1004, 'weekday', '06:34:00', 'northbound'),
(50380, 8, 1004, 'weekday', '06:42:00', 'northbound'),
(50381, 8, 1004, 'weekday', '06:50:00', 'northbound'),
(50382, 8, 1004, 'weekday', '06:58:00', 'northbound'),
(50383, 8, 1004, 'weekday', '07:06:00', 'northbound'),
(50384, 8, 1004, 'weekday', '07:14:00', 'northbound'),
(50385, 8, 1004, 'weekday', '07:22:00', 'northbound');
-- Yellow Line @ Jackson (1004) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50386, 8, 1004, 'sunday_holiday', '10:10:00', 'northbound'),
(50387, 8, 1004, 'sunday_holiday', '10:30:00', 'northbound'),
(50388, 8, 1004, 'sunday_holiday', '10:50:00', 'northbound');
-- Yellow Line @ Jackson (1004) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50389, 8, 1004, 'saturday', '09:10:00', 'northbound'),
(50390, 8, 1004, 'saturday', '09:30:00', 'northbound');

-- 8 Halsted (9) - northbound
-- 8 Halsted @ Halsted/79th (1011) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50391, 9, 1011, 'weekday', '06:00:00', 'northbound'),
(50392, 9, 1011, 'weekday', '06:08:00', 'northbound'),
(50393, 9, 1011, 'weekday', '06:16:00', 'northbound'),
(50394, 9, 1011, 'weekday', '06:24:00', 'northbound'),
(50395, 9, 1011, 'weekday', '06:32:00', 'northbound'),
(50396, 9, 1011, 'weekday', '06:40:00', 'northbound'),
(50397, 9, 1011, 'weekday', '06:48:00', 'northbound'),
(50398, 9, 1011, 'weekday', '06:56:00', 'northbound'),
(50399, 9, 1011, 'weekday', '07:04:00', 'northbound'),
(50400, 9, 1011, 'weekday', '07:12:00', 'northbound');
-- 8 Halsted @ Halsted/79th (1011) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50401, 9, 1011, 'sunday_holiday', '10:00:00', 'northbound'),
(50402, 9, 1011, 'sunday_holiday', '10:20:00', 'northbound'),
(50403, 9, 1011, 'sunday_holiday', '10:40:00', 'northbound');
-- 8 Halsted @ Halsted/79th (1011) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50404, 9, 1011, 'saturday', '09:00:00', 'northbound'),
(50405, 9, 1011, 'saturday', '09:20:00', 'northbound');
-- 8 Halsted @ Broadway/Waveland (1012) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50406, 9, 1012, 'weekday', '06:05:00', 'northbound'),
(50407, 9, 1012, 'weekday', '06:13:00', 'northbound'),
(50408, 9, 1012, 'weekday', '06:21:00', 'northbound'),
(50409, 9, 1012, 'weekday', '06:29:00', 'northbound'),
(50410, 9, 1012, 'weekday', '06:37:00', 'northbound'),
(50411, 9, 1012, 'weekday', '06:45:00', 'northbound'),
(50412, 9, 1012, 'weekday', '06:53:00', 'northbound'),
(50413, 9, 1012, 'weekday', '07:01:00', 'northbound'),
(50414, 9, 1012, 'weekday', '07:09:00', 'northbound'),
(50415, 9, 1012, 'weekday', '07:17:00', 'northbound');
-- 8 Halsted @ Broadway/Waveland (1012) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50416, 9, 1012, 'sunday_holiday', '10:05:00', 'northbound'),
(50417, 9, 1012, 'sunday_holiday', '10:25:00', 'northbound'),
(50418, 9, 1012, 'sunday_holiday', '10:45:00', 'northbound');
-- 8 Halsted @ Broadway/Waveland (1012) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50419, 9, 1012, 'saturday', '09:05:00', 'northbound'),
(50420, 9, 1012, 'saturday', '09:25:00', 'northbound');
-- 8 Halsted @ Ashland/63rd (1013) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50421, 9, 1013, 'weekday', '06:10:00', 'northbound'),
(50422, 9, 1013, 'weekday', '06:18:00', 'northbound'),
(50423, 9, 1013, 'weekday', '06:26:00', 'northbound'),
(50424, 9, 1013, 'weekday', '06:34:00', 'northbound'),
(50425, 9, 1013, 'weekday', '06:42:00', 'northbound'),
(50426, 9, 1013, 'weekday', '06:50:00', 'northbound'),
(50427, 9, 1013, 'weekday', '06:58:00', 'northbound'),
(50428, 9, 1013, 'weekday', '07:06:00', 'northbound'),
(50429, 9, 1013, 'weekday', '07:14:00', 'northbound'),
(50430, 9, 1013, 'weekday', '07:22:00', 'northbound');
-- 8 Halsted @ Ashland/63rd (1013) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50431, 9, 1013, 'sunday_holiday', '10:10:00', 'northbound'),
(50432, 9, 1013, 'sunday_holiday', '10:30:00', 'northbound'),
(50433, 9, 1013, 'sunday_holiday', '10:50:00', 'northbound');
-- 8 Halsted @ Ashland/63rd (1013) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50434, 9, 1013, 'saturday', '09:10:00', 'northbound'),
(50435, 9, 1013, 'saturday', '09:30:00', 'northbound');

-- 9 Ashland (10) - northbound
-- 9 Ashland @ Ashland/63rd (1013) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50436, 10, 1013, 'weekday', '06:00:00', 'northbound'),
(50437, 10, 1013, 'weekday', '06:08:00', 'northbound'),
(50438, 10, 1013, 'weekday', '06:16:00', 'northbound'),
(50439, 10, 1013, 'weekday', '06:24:00', 'northbound'),
(50440, 10, 1013, 'weekday', '06:32:00', 'northbound'),
(50441, 10, 1013, 'weekday', '06:40:00', 'northbound'),
(50442, 10, 1013, 'weekday', '06:48:00', 'northbound'),
(50443, 10, 1013, 'weekday', '06:56:00', 'northbound'),
(50444, 10, 1013, 'weekday', '07:04:00', 'northbound'),
(50445, 10, 1013, 'weekday', '07:12:00', 'northbound');
-- 9 Ashland @ Ashland/63rd (1013) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50446, 10, 1013, 'sunday_holiday', '10:00:00', 'northbound'),
(50447, 10, 1013, 'sunday_holiday', '10:20:00', 'northbound'),
(50448, 10, 1013, 'sunday_holiday', '10:40:00', 'northbound');
-- 9 Ashland @ Ashland/63rd (1013) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50449, 10, 1013, 'saturday', '09:00:00', 'northbound'),
(50450, 10, 1013, 'saturday', '09:20:00', 'northbound');
-- 9 Ashland @ Roosevelt (1005) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50451, 10, 1005, 'weekday', '06:05:00', 'northbound'),
(50452, 10, 1005, 'weekday', '06:13:00', 'northbound'),
(50453, 10, 1005, 'weekday', '06:21:00', 'northbound'),
(50454, 10, 1005, 'weekday', '06:29:00', 'northbound'),
(50455, 10, 1005, 'weekday', '06:37:00', 'northbound'),
(50456, 10, 1005, 'weekday', '06:45:00', 'northbound'),
(50457, 10, 1005, 'weekday', '06:53:00', 'northbound'),
(50458, 10, 1005, 'weekday', '07:01:00', 'northbound'),
(50459, 10, 1005, 'weekday', '07:09:00', 'northbound'),
(50460, 10, 1005, 'weekday', '07:17:00', 'northbound');
-- 9 Ashland @ Roosevelt (1005) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50461, 10, 1005, 'sunday_holiday', '10:05:00', 'northbound'),
(50462, 10, 1005, 'sunday_holiday', '10:25:00', 'northbound'),
(50463, 10, 1005, 'sunday_holiday', '10:45:00', 'northbound');
-- 9 Ashland @ Roosevelt (1005) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50464, 10, 1005, 'saturday', '09:05:00', 'northbound'),
(50465, 10, 1005, 'saturday', '09:25:00', 'northbound');
-- 9 Ashland @ Michigan/Chicago (1014) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50466, 10, 1014, 'weekday', '06:10:00', 'northbound'),
(50467, 10, 1014, 'weekday', '06:18:00', 'northbound'),
(50468, 10, 1014, 'weekday', '06:26:00', 'northbound'),
(50469, 10, 1014, 'weekday', '06:34:00', 'northbound'),
(50470, 10, 1014, 'weekday', '06:42:00', 'northbound'),
(50471, 10, 1014, 'weekday', '06:50:00', 'northbound'),
(50472, 10, 1014, 'weekday', '06:58:00', 'northbound'),
(50473, 10, 1014, 'weekday', '07:06:00', 'northbound'),
(50474, 10, 1014, 'weekday', '07:14:00', 'northbound'),
(50475, 10, 1014, 'weekday', '07:22:00', 'northbound');
-- 9 Ashland @ Michigan/Chicago (1014) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50476, 10, 1014, 'sunday_holiday', '10:10:00', 'northbound'),
(50477, 10, 1014, 'sunday_holiday', '10:30:00', 'northbound'),
(50478, 10, 1014, 'sunday_holiday', '10:50:00', 'northbound');
-- 9 Ashland @ Michigan/Chicago (1014) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50479, 10, 1014, 'saturday', '09:10:00', 'northbound'),
(50480, 10, 1014, 'saturday', '09:30:00', 'northbound');

-- 20 Madison (11) - northbound
-- 20 Madison @ Halsted/79th (1011) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50481, 11, 1011, 'weekday', '06:00:00', 'northbound'),
(50482, 11, 1011, 'weekday', '06:08:00', 'northbound'),
(50483, 11, 1011, 'weekday', '06:16:00', 'northbound'),
(50484, 11, 1011, 'weekday', '06:24:00', 'northbound'),
(50485, 11, 1011, 'weekday', '06:32:00', 'northbound'),
(50486, 11, 1011, 'weekday', '06:40:00', 'northbound'),
(50487, 11, 1011, 'weekday', '06:48:00', 'northbound'),
(50488, 11, 1011, 'weekday', '06:56:00', 'northbound'),
(50489, 11, 1011, 'weekday', '07:04:00', 'northbound'),
(50490, 11, 1011, 'weekday', '07:12:00', 'northbound');
-- 20 Madison @ Halsted/79th (1011) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50491, 11, 1011, 'sunday_holiday', '10:00:00', 'northbound'),
(50492, 11, 1011, 'sunday_holiday', '10:20:00', 'northbound'),
(50493, 11, 1011, 'sunday_holiday', '10:40:00', 'northbound');
-- 20 Madison @ Halsted/79th (1011) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50494, 11, 1011, 'saturday', '09:00:00', 'northbound'),
(50495, 11, 1011, 'saturday', '09:20:00', 'northbound');
-- 20 Madison @ Broadway/Waveland (1012) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50496, 11, 1012, 'weekday', '06:05:00', 'northbound'),
(50497, 11, 1012, 'weekday', '06:13:00', 'northbound'),
(50498, 11, 1012, 'weekday', '06:21:00', 'northbound'),
(50499, 11, 1012, 'weekday', '06:29:00', 'northbound'),
(50500, 11, 1012, 'weekday', '06:37:00', 'northbound'),
(50501, 11, 1012, 'weekday', '06:45:00', 'northbound'),
(50502, 11, 1012, 'weekday', '06:53:00', 'northbound'),
(50503, 11, 1012, 'weekday', '07:01:00', 'northbound'),
(50504, 11, 1012, 'weekday', '07:09:00', 'northbound'),
(50505, 11, 1012, 'weekday', '07:17:00', 'northbound');
-- 20 Madison @ Broadway/Waveland (1012) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50506, 11, 1012, 'sunday_holiday', '10:05:00', 'northbound'),
(50507, 11, 1012, 'sunday_holiday', '10:25:00', 'northbound'),
(50508, 11, 1012, 'sunday_holiday', '10:45:00', 'northbound');
-- 20 Madison @ Broadway/Waveland (1012) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50509, 11, 1012, 'saturday', '09:05:00', 'northbound'),
(50510, 11, 1012, 'saturday', '09:25:00', 'northbound');
-- 20 Madison @ Ashland/63rd (1013) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50511, 11, 1013, 'weekday', '06:10:00', 'northbound'),
(50512, 11, 1013, 'weekday', '06:18:00', 'northbound'),
(50513, 11, 1013, 'weekday', '06:26:00', 'northbound'),
(50514, 11, 1013, 'weekday', '06:34:00', 'northbound'),
(50515, 11, 1013, 'weekday', '06:42:00', 'northbound'),
(50516, 11, 1013, 'weekday', '06:50:00', 'northbound'),
(50517, 11, 1013, 'weekday', '06:58:00', 'northbound'),
(50518, 11, 1013, 'weekday', '07:06:00', 'northbound'),
(50519, 11, 1013, 'weekday', '07:14:00', 'northbound'),
(50520, 11, 1013, 'weekday', '07:22:00', 'northbound');
-- 20 Madison @ Ashland/63rd (1013) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50521, 11, 1013, 'sunday_holiday', '10:10:00', 'northbound'),
(50522, 11, 1013, 'sunday_holiday', '10:30:00', 'northbound'),
(50523, 11, 1013, 'sunday_holiday', '10:50:00', 'northbound');
-- 20 Madison @ Ashland/63rd (1013) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50524, 11, 1013, 'saturday', '09:10:00', 'northbound'),
(50525, 11, 1013, 'saturday', '09:30:00', 'northbound');

-- 22 Clark (12) - northbound
-- 22 Clark @ Halsted/79th (1011) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50526, 12, 1011, 'weekday', '06:00:00', 'northbound'),
(50527, 12, 1011, 'weekday', '06:08:00', 'northbound'),
(50528, 12, 1011, 'weekday', '06:16:00', 'northbound'),
(50529, 12, 1011, 'weekday', '06:24:00', 'northbound'),
(50530, 12, 1011, 'weekday', '06:32:00', 'northbound'),
(50531, 12, 1011, 'weekday', '06:40:00', 'northbound'),
(50532, 12, 1011, 'weekday', '06:48:00', 'northbound'),
(50533, 12, 1011, 'weekday', '06:56:00', 'northbound'),
(50534, 12, 1011, 'weekday', '07:04:00', 'northbound'),
(50535, 12, 1011, 'weekday', '07:12:00', 'northbound');
-- 22 Clark @ Halsted/79th (1011) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50536, 12, 1011, 'sunday_holiday', '10:00:00', 'northbound'),
(50537, 12, 1011, 'sunday_holiday', '10:20:00', 'northbound'),
(50538, 12, 1011, 'sunday_holiday', '10:40:00', 'northbound');
-- 22 Clark @ Halsted/79th (1011) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50539, 12, 1011, 'saturday', '09:00:00', 'northbound'),
(50540, 12, 1011, 'saturday', '09:20:00', 'northbound');
-- 22 Clark @ Navy Pier Terminal (1015) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50541, 12, 1015, 'weekday', '06:05:00', 'northbound'),
(50542, 12, 1015, 'weekday', '06:13:00', 'northbound'),
(50543, 12, 1015, 'weekday', '06:21:00', 'northbound'),
(50544, 12, 1015, 'weekday', '06:29:00', 'northbound'),
(50545, 12, 1015, 'weekday', '06:37:00', 'northbound'),
(50546, 12, 1015, 'weekday', '06:45:00', 'northbound'),
(50547, 12, 1015, 'weekday', '06:53:00', 'northbound'),
(50548, 12, 1015, 'weekday', '07:01:00', 'northbound'),
(50549, 12, 1015, 'weekday', '07:09:00', 'northbound'),
(50550, 12, 1015, 'weekday', '07:17:00', 'northbound');
-- 22 Clark @ Navy Pier Terminal (1015) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50551, 12, 1015, 'sunday_holiday', '10:05:00', 'northbound'),
(50552, 12, 1015, 'sunday_holiday', '10:25:00', 'northbound'),
(50553, 12, 1015, 'sunday_holiday', '10:45:00', 'northbound');
-- 22 Clark @ Navy Pier Terminal (1015) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50554, 12, 1015, 'saturday', '09:05:00', 'northbound'),
(50555, 12, 1015, 'saturday', '09:25:00', 'northbound');
-- 22 Clark @ Ashland/63rd (1013) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50556, 12, 1013, 'weekday', '06:10:00', 'northbound'),
(50557, 12, 1013, 'weekday', '06:18:00', 'northbound'),
(50558, 12, 1013, 'weekday', '06:26:00', 'northbound'),
(50559, 12, 1013, 'weekday', '06:34:00', 'northbound'),
(50560, 12, 1013, 'weekday', '06:42:00', 'northbound'),
(50561, 12, 1013, 'weekday', '06:50:00', 'northbound'),
(50562, 12, 1013, 'weekday', '06:58:00', 'northbound'),
(50563, 12, 1013, 'weekday', '07:06:00', 'northbound'),
(50564, 12, 1013, 'weekday', '07:14:00', 'northbound'),
(50565, 12, 1013, 'weekday', '07:22:00', 'northbound');
-- 22 Clark @ Ashland/63rd (1013) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50566, 12, 1013, 'sunday_holiday', '10:10:00', 'northbound'),
(50567, 12, 1013, 'sunday_holiday', '10:30:00', 'northbound'),
(50568, 12, 1013, 'sunday_holiday', '10:50:00', 'northbound');
-- 22 Clark @ Ashland/63rd (1013) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50569, 12, 1013, 'saturday', '09:10:00', 'northbound'),
(50570, 12, 1013, 'saturday', '09:30:00', 'northbound');

-- 36 Broadway (13) - northbound
-- 36 Broadway @ Halsted/79th (1011) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50571, 13, 1011, 'weekday', '06:00:00', 'northbound'),
(50572, 13, 1011, 'weekday', '06:08:00', 'northbound'),
(50573, 13, 1011, 'weekday', '06:16:00', 'northbound'),
(50574, 13, 1011, 'weekday', '06:24:00', 'northbound'),
(50575, 13, 1011, 'weekday', '06:32:00', 'northbound'),
(50576, 13, 1011, 'weekday', '06:40:00', 'northbound'),
(50577, 13, 1011, 'weekday', '06:48:00', 'northbound'),
(50578, 13, 1011, 'weekday', '06:56:00', 'northbound'),
(50579, 13, 1011, 'weekday', '07:04:00', 'northbound'),
(50580, 13, 1011, 'weekday', '07:12:00', 'northbound');
-- 36 Broadway @ Halsted/79th (1011) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50581, 13, 1011, 'sunday_holiday', '10:00:00', 'northbound'),
(50582, 13, 1011, 'sunday_holiday', '10:20:00', 'northbound'),
(50583, 13, 1011, 'sunday_holiday', '10:40:00', 'northbound');
-- 36 Broadway @ Halsted/79th (1011) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50584, 13, 1011, 'saturday', '09:00:00', 'northbound'),
(50585, 13, 1011, 'saturday', '09:20:00', 'northbound');
-- 36 Broadway @ Broadway/Waveland (1012) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50586, 13, 1012, 'weekday', '06:05:00', 'northbound'),
(50587, 13, 1012, 'weekday', '06:13:00', 'northbound'),
(50588, 13, 1012, 'weekday', '06:21:00', 'northbound'),
(50589, 13, 1012, 'weekday', '06:29:00', 'northbound'),
(50590, 13, 1012, 'weekday', '06:37:00', 'northbound'),
(50591, 13, 1012, 'weekday', '06:45:00', 'northbound'),
(50592, 13, 1012, 'weekday', '06:53:00', 'northbound'),
(50593, 13, 1012, 'weekday', '07:01:00', 'northbound'),
(50594, 13, 1012, 'weekday', '07:09:00', 'northbound'),
(50595, 13, 1012, 'weekday', '07:17:00', 'northbound');
-- 36 Broadway @ Broadway/Waveland (1012) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50596, 13, 1012, 'sunday_holiday', '10:05:00', 'northbound'),
(50597, 13, 1012, 'sunday_holiday', '10:25:00', 'northbound'),
(50598, 13, 1012, 'sunday_holiday', '10:45:00', 'northbound');
-- 36 Broadway @ Broadway/Waveland (1012) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50599, 13, 1012, 'saturday', '09:05:00', 'northbound'),
(50600, 13, 1012, 'saturday', '09:25:00', 'northbound');
-- 36 Broadway @ Ashland/63rd (1013) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50601, 13, 1013, 'weekday', '06:10:00', 'northbound'),
(50602, 13, 1013, 'weekday', '06:18:00', 'northbound'),
(50603, 13, 1013, 'weekday', '06:26:00', 'northbound'),
(50604, 13, 1013, 'weekday', '06:34:00', 'northbound'),
(50605, 13, 1013, 'weekday', '06:42:00', 'northbound'),
(50606, 13, 1013, 'weekday', '06:50:00', 'northbound'),
(50607, 13, 1013, 'weekday', '06:58:00', 'northbound'),
(50608, 13, 1013, 'weekday', '07:06:00', 'northbound'),
(50609, 13, 1013, 'weekday', '07:14:00', 'northbound'),
(50610, 13, 1013, 'weekday', '07:22:00', 'northbound');
-- 36 Broadway @ Ashland/63rd (1013) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50611, 13, 1013, 'sunday_holiday', '10:10:00', 'northbound'),
(50612, 13, 1013, 'sunday_holiday', '10:30:00', 'northbound'),
(50613, 13, 1013, 'sunday_holiday', '10:50:00', 'northbound');
-- 36 Broadway @ Ashland/63rd (1013) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50614, 13, 1013, 'saturday', '09:10:00', 'northbound'),
(50615, 13, 1013, 'saturday', '09:30:00', 'northbound');
-- 36 Broadway @ Jackson (1004) seq 4 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50616, 13, 1004, 'weekday', '06:15:00', 'northbound'),
(50617, 13, 1004, 'weekday', '06:23:00', 'northbound'),
(50618, 13, 1004, 'weekday', '06:31:00', 'northbound'),
(50619, 13, 1004, 'weekday', '06:39:00', 'northbound'),
(50620, 13, 1004, 'weekday', '06:47:00', 'northbound'),
(50621, 13, 1004, 'weekday', '06:55:00', 'northbound'),
(50622, 13, 1004, 'weekday', '07:03:00', 'northbound'),
(50623, 13, 1004, 'weekday', '07:11:00', 'northbound'),
(50624, 13, 1004, 'weekday', '07:19:00', 'northbound'),
(50625, 13, 1004, 'weekday', '07:27:00', 'northbound');
-- 36 Broadway @ Jackson (1004) seq 4 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50626, 13, 1004, 'sunday_holiday', '10:15:00', 'northbound'),
(50627, 13, 1004, 'sunday_holiday', '10:35:00', 'northbound'),
(50628, 13, 1004, 'sunday_holiday', '10:55:00', 'northbound');
-- 36 Broadway @ Jackson (1004) seq 4 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50629, 13, 1004, 'saturday', '09:15:00', 'northbound'),
(50630, 13, 1004, 'saturday', '09:35:00', 'northbound');
-- 36 Broadway @ Clark/Lake (1006) seq 5 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50631, 13, 1006, 'weekday', '06:20:00', 'northbound'),
(50632, 13, 1006, 'weekday', '06:28:00', 'northbound'),
(50633, 13, 1006, 'weekday', '06:36:00', 'northbound'),
(50634, 13, 1006, 'weekday', '06:44:00', 'northbound'),
(50635, 13, 1006, 'weekday', '06:52:00', 'northbound'),
(50636, 13, 1006, 'weekday', '07:00:00', 'northbound'),
(50637, 13, 1006, 'weekday', '07:08:00', 'northbound'),
(50638, 13, 1006, 'weekday', '07:16:00', 'northbound'),
(50639, 13, 1006, 'weekday', '07:24:00', 'northbound'),
(50640, 13, 1006, 'weekday', '07:32:00', 'northbound');
-- 36 Broadway @ Clark/Lake (1006) seq 5 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50641, 13, 1006, 'sunday_holiday', '10:20:00', 'northbound'),
(50642, 13, 1006, 'sunday_holiday', '10:40:00', 'northbound'),
(50643, 13, 1006, 'sunday_holiday', '11:00:00', 'northbound');
-- 36 Broadway @ Clark/Lake (1006) seq 5 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50644, 13, 1006, 'saturday', '09:20:00', 'northbound'),
(50645, 13, 1006, 'saturday', '09:40:00', 'northbound');

-- 66 Chicago (14) - northbound
-- 66 Chicago @ Michigan/Chicago (1014) seq 1 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50646, 14, 1014, 'weekday', '06:00:00', 'northbound'),
(50647, 14, 1014, 'weekday', '06:08:00', 'northbound'),
(50648, 14, 1014, 'weekday', '06:16:00', 'northbound'),
(50649, 14, 1014, 'weekday', '06:24:00', 'northbound'),
(50650, 14, 1014, 'weekday', '06:32:00', 'northbound'),
(50651, 14, 1014, 'weekday', '06:40:00', 'northbound'),
(50652, 14, 1014, 'weekday', '06:48:00', 'northbound'),
(50653, 14, 1014, 'weekday', '06:56:00', 'northbound'),
(50654, 14, 1014, 'weekday', '07:04:00', 'northbound'),
(50655, 14, 1014, 'weekday', '07:12:00', 'northbound');
-- 66 Chicago @ Michigan/Chicago (1014) seq 1 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50656, 14, 1014, 'sunday_holiday', '10:00:00', 'northbound'),
(50657, 14, 1014, 'sunday_holiday', '10:20:00', 'northbound'),
(50658, 14, 1014, 'sunday_holiday', '10:40:00', 'northbound');
-- 66 Chicago @ Michigan/Chicago (1014) seq 1 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50659, 14, 1014, 'saturday', '09:00:00', 'northbound'),
(50660, 14, 1014, 'saturday', '09:20:00', 'northbound');
-- 66 Chicago @ Navy Pier Terminal (1015) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50661, 14, 1015, 'weekday', '06:05:00', 'northbound'),
(50662, 14, 1015, 'weekday', '06:13:00', 'northbound'),
(50663, 14, 1015, 'weekday', '06:21:00', 'northbound'),
(50664, 14, 1015, 'weekday', '06:29:00', 'northbound'),
(50665, 14, 1015, 'weekday', '06:37:00', 'northbound'),
(50666, 14, 1015, 'weekday', '06:45:00', 'northbound'),
(50667, 14, 1015, 'weekday', '06:53:00', 'northbound'),
(50668, 14, 1015, 'weekday', '07:01:00', 'northbound'),
(50669, 14, 1015, 'weekday', '07:09:00', 'northbound'),
(50670, 14, 1015, 'weekday', '07:17:00', 'northbound');
-- 66 Chicago @ Navy Pier Terminal (1015) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50671, 14, 1015, 'sunday_holiday', '10:05:00', 'northbound'),
(50672, 14, 1015, 'sunday_holiday', '10:25:00', 'northbound'),
(50673, 14, 1015, 'sunday_holiday', '10:45:00', 'northbound');
-- 66 Chicago @ Navy Pier Terminal (1015) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50674, 14, 1015, 'saturday', '09:05:00', 'northbound'),
(50675, 14, 1015, 'saturday', '09:25:00', 'northbound');
-- 66 Chicago @ Huron (1016) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50676, 14, 1016, 'weekday', '06:10:00', 'northbound'),
(50677, 14, 1016, 'weekday', '06:18:00', 'northbound'),
(50678, 14, 1016, 'weekday', '06:26:00', 'northbound'),
(50679, 14, 1016, 'weekday', '06:34:00', 'northbound'),
(50680, 14, 1016, 'weekday', '06:42:00', 'northbound'),
(50681, 14, 1016, 'weekday', '06:50:00', 'northbound'),
(50682, 14, 1016, 'weekday', '06:58:00', 'northbound'),
(50683, 14, 1016, 'weekday', '07:06:00', 'northbound'),
(50684, 14, 1016, 'weekday', '07:14:00', 'northbound'),
(50685, 14, 1016, 'weekday', '07:22:00', 'northbound');
-- 66 Chicago @ Huron (1016) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50686, 14, 1016, 'sunday_holiday', '10:10:00', 'northbound'),
(50687, 14, 1016, 'sunday_holiday', '10:30:00', 'northbound'),
(50688, 14, 1016, 'sunday_holiday', '10:50:00', 'northbound');
-- 66 Chicago @ Huron (1016) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50689, 14, 1016, 'saturday', '09:10:00', 'northbound'),
(50690, 14, 1016, 'saturday', '09:30:00', 'northbound');
-- 66 Chicago @ Shore Drive (1017) seq 4 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50691, 14, 1017, 'weekday', '06:15:00', 'northbound'),
(50692, 14, 1017, 'weekday', '06:23:00', 'northbound'),
(50693, 14, 1017, 'weekday', '06:31:00', 'northbound'),
(50694, 14, 1017, 'weekday', '06:39:00', 'northbound'),
(50695, 14, 1017, 'weekday', '06:47:00', 'northbound'),
(50696, 14, 1017, 'weekday', '06:55:00', 'northbound'),
(50697, 14, 1017, 'weekday', '07:03:00', 'northbound'),
(50698, 14, 1017, 'weekday', '07:11:00', 'northbound'),
(50699, 14, 1017, 'weekday', '07:19:00', 'northbound'),
(50700, 14, 1017, 'weekday', '07:27:00', 'northbound');
-- 66 Chicago @ Shore Drive (1017) seq 4 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50701, 14, 1017, 'sunday_holiday', '10:15:00', 'northbound'),
(50702, 14, 1017, 'sunday_holiday', '10:35:00', 'northbound'),
(50703, 14, 1017, 'sunday_holiday', '10:55:00', 'northbound');
-- 66 Chicago @ Shore Drive (1017) seq 4 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50704, 14, 1017, 'saturday', '09:15:00', 'northbound'),
(50705, 14, 1017, 'saturday', '09:35:00', 'northbound');

-- 151 Sheridan (15) - northbound
-- 151 Sheridan @ Navy Pier Terminal (1015) seq 2 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50706, 15, 1015, 'weekday', '06:00:00', 'northbound'),
(50707, 15, 1015, 'weekday', '06:08:00', 'northbound'),
(50708, 15, 1015, 'weekday', '06:16:00', 'northbound'),
(50709, 15, 1015, 'weekday', '06:24:00', 'northbound'),
(50710, 15, 1015, 'weekday', '06:32:00', 'northbound'),
(50711, 15, 1015, 'weekday', '06:40:00', 'northbound'),
(50712, 15, 1015, 'weekday', '06:48:00', 'northbound'),
(50713, 15, 1015, 'weekday', '06:56:00', 'northbound'),
(50714, 15, 1015, 'weekday', '07:04:00', 'northbound'),
(50715, 15, 1015, 'weekday', '07:12:00', 'northbound');
-- 151 Sheridan @ Navy Pier Terminal (1015) seq 2 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50716, 15, 1015, 'sunday_holiday', '10:00:00', 'northbound'),
(50717, 15, 1015, 'sunday_holiday', '10:20:00', 'northbound'),
(50718, 15, 1015, 'sunday_holiday', '10:40:00', 'northbound');
-- 151 Sheridan @ Navy Pier Terminal (1015) seq 2 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50719, 15, 1015, 'saturday', '09:00:00', 'northbound'),
(50720, 15, 1015, 'saturday', '09:20:00', 'northbound');
-- 151 Sheridan @ Huron (1016) seq 3 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50721, 15, 1016, 'weekday', '06:05:00', 'northbound'),
(50722, 15, 1016, 'weekday', '06:13:00', 'northbound'),
(50723, 15, 1016, 'weekday', '06:21:00', 'northbound'),
(50724, 15, 1016, 'weekday', '06:29:00', 'northbound'),
(50725, 15, 1016, 'weekday', '06:37:00', 'northbound'),
(50726, 15, 1016, 'weekday', '06:45:00', 'northbound'),
(50727, 15, 1016, 'weekday', '06:53:00', 'northbound'),
(50728, 15, 1016, 'weekday', '07:01:00', 'northbound'),
(50729, 15, 1016, 'weekday', '07:09:00', 'northbound'),
(50730, 15, 1016, 'weekday', '07:17:00', 'northbound');
-- 151 Sheridan @ Huron (1016) seq 3 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50731, 15, 1016, 'sunday_holiday', '10:05:00', 'northbound'),
(50732, 15, 1016, 'sunday_holiday', '10:25:00', 'northbound'),
(50733, 15, 1016, 'sunday_holiday', '10:45:00', 'northbound');
-- 151 Sheridan @ Huron (1016) seq 3 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50734, 15, 1016, 'saturday', '09:05:00', 'northbound'),
(50735, 15, 1016, 'saturday', '09:25:00', 'northbound');
-- 151 Sheridan @ Shore Drive (1017) seq 4 - weekday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50736, 15, 1017, 'weekday', '06:10:00', 'northbound'),
(50737, 15, 1017, 'weekday', '06:18:00', 'northbound'),
(50738, 15, 1017, 'weekday', '06:26:00', 'northbound'),
(50739, 15, 1017, 'weekday', '06:34:00', 'northbound'),
(50740, 15, 1017, 'weekday', '06:42:00', 'northbound'),
(50741, 15, 1017, 'weekday', '06:50:00', 'northbound'),
(50742, 15, 1017, 'weekday', '06:58:00', 'northbound'),
(50743, 15, 1017, 'weekday', '07:06:00', 'northbound'),
(50744, 15, 1017, 'weekday', '07:14:00', 'northbound'),
(50745, 15, 1017, 'weekday', '07:22:00', 'northbound');
-- 151 Sheridan @ Shore Drive (1017) seq 4 - sunday_holiday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50746, 15, 1017, 'sunday_holiday', '10:10:00', 'northbound'),
(50747, 15, 1017, 'sunday_holiday', '10:30:00', 'northbound'),
(50748, 15, 1017, 'sunday_holiday', '10:50:00', 'northbound');
-- 151 Sheridan @ Shore Drive (1017) seq 4 - saturday northbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(50749, 15, 1017, 'saturday', '09:10:00', 'northbound'),
(50750, 15, 1017, 'saturday', '09:30:00', 'northbound');

-- Southbound schedule data
-- Times increase as stopSequence DECREASES (highest seq departs first)
-- +5 min per stop along each line in reverse direction
-- 10 weekday, 3 sunday_holiday, 2 saturday entries per station, all southbound


-- Red Line (1) - southbound
-- Red Line @ Howard (1001) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60001, 1, 1001, 'weekday', '12:20:00', 'southbound'),
(60002, 1, 1001, 'weekday', '12:28:00', 'southbound'),
(60003, 1, 1001, 'weekday', '12:36:00', 'southbound'),
(60004, 1, 1001, 'weekday', '12:44:00', 'southbound'),
(60005, 1, 1001, 'weekday', '12:52:00', 'southbound'),
(60006, 1, 1001, 'weekday', '13:00:00', 'southbound'),
(60007, 1, 1001, 'weekday', '13:08:00', 'southbound'),
(60008, 1, 1001, 'weekday', '13:16:00', 'southbound'),
(60009, 1, 1001, 'weekday', '13:24:00', 'southbound'),
(60010, 1, 1001, 'weekday', '13:32:00', 'southbound');
-- Red Line @ Howard (1001) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60011, 1, 1001, 'sunday_holiday', '14:20:00', 'southbound'),
(60012, 1, 1001, 'sunday_holiday', '14:40:00', 'southbound'),
(60013, 1, 1001, 'sunday_holiday', '15:00:00', 'southbound');
-- Red Line @ Howard (1001) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60014, 1, 1001, 'saturday', '15:20:00', 'southbound'),
(60015, 1, 1001, 'saturday', '15:40:00', 'southbound');
-- Red Line @ Belmont (1002) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60016, 1, 1002, 'weekday', '12:15:00', 'southbound'),
(60017, 1, 1002, 'weekday', '12:23:00', 'southbound'),
(60018, 1, 1002, 'weekday', '12:31:00', 'southbound'),
(60019, 1, 1002, 'weekday', '12:39:00', 'southbound'),
(60020, 1, 1002, 'weekday', '12:47:00', 'southbound'),
(60021, 1, 1002, 'weekday', '12:55:00', 'southbound'),
(60022, 1, 1002, 'weekday', '13:03:00', 'southbound'),
(60023, 1, 1002, 'weekday', '13:11:00', 'southbound'),
(60024, 1, 1002, 'weekday', '13:19:00', 'southbound'),
(60025, 1, 1002, 'weekday', '13:27:00', 'southbound');
-- Red Line @ Belmont (1002) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60026, 1, 1002, 'sunday_holiday', '14:15:00', 'southbound'),
(60027, 1, 1002, 'sunday_holiday', '14:35:00', 'southbound'),
(60028, 1, 1002, 'sunday_holiday', '14:55:00', 'southbound');
-- Red Line @ Belmont (1002) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60029, 1, 1002, 'saturday', '15:15:00', 'southbound'),
(60030, 1, 1002, 'saturday', '15:35:00', 'southbound');
-- Red Line @ Fullerton (1003) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60031, 1, 1003, 'weekday', '12:10:00', 'southbound'),
(60032, 1, 1003, 'weekday', '12:18:00', 'southbound'),
(60033, 1, 1003, 'weekday', '12:26:00', 'southbound'),
(60034, 1, 1003, 'weekday', '12:34:00', 'southbound'),
(60035, 1, 1003, 'weekday', '12:42:00', 'southbound'),
(60036, 1, 1003, 'weekday', '12:50:00', 'southbound'),
(60037, 1, 1003, 'weekday', '12:58:00', 'southbound'),
(60038, 1, 1003, 'weekday', '13:06:00', 'southbound'),
(60039, 1, 1003, 'weekday', '13:14:00', 'southbound'),
(60040, 1, 1003, 'weekday', '13:22:00', 'southbound');
-- Red Line @ Fullerton (1003) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60041, 1, 1003, 'sunday_holiday', '14:10:00', 'southbound'),
(60042, 1, 1003, 'sunday_holiday', '14:30:00', 'southbound'),
(60043, 1, 1003, 'sunday_holiday', '14:50:00', 'southbound');
-- Red Line @ Fullerton (1003) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60044, 1, 1003, 'saturday', '15:10:00', 'southbound'),
(60045, 1, 1003, 'saturday', '15:30:00', 'southbound');
-- Red Line @ Jackson (1004) seq 4 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60046, 1, 1004, 'weekday', '12:05:00', 'southbound'),
(60047, 1, 1004, 'weekday', '12:13:00', 'southbound'),
(60048, 1, 1004, 'weekday', '12:21:00', 'southbound'),
(60049, 1, 1004, 'weekday', '12:29:00', 'southbound'),
(60050, 1, 1004, 'weekday', '12:37:00', 'southbound'),
(60051, 1, 1004, 'weekday', '12:45:00', 'southbound'),
(60052, 1, 1004, 'weekday', '12:53:00', 'southbound'),
(60053, 1, 1004, 'weekday', '13:01:00', 'southbound'),
(60054, 1, 1004, 'weekday', '13:09:00', 'southbound'),
(60055, 1, 1004, 'weekday', '13:17:00', 'southbound');
-- Red Line @ Jackson (1004) seq 4 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60056, 1, 1004, 'sunday_holiday', '14:05:00', 'southbound'),
(60057, 1, 1004, 'sunday_holiday', '14:25:00', 'southbound'),
(60058, 1, 1004, 'sunday_holiday', '14:45:00', 'southbound');
-- Red Line @ Jackson (1004) seq 4 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60059, 1, 1004, 'saturday', '15:05:00', 'southbound'),
(60060, 1, 1004, 'saturday', '15:25:00', 'southbound');
-- Red Line @ 95th/Dan Ryan (1008) seq 5 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60061, 1, 1008, 'weekday', '12:00:00', 'southbound'),
(60062, 1, 1008, 'weekday', '12:08:00', 'southbound'),
(60063, 1, 1008, 'weekday', '12:16:00', 'southbound'),
(60064, 1, 1008, 'weekday', '12:24:00', 'southbound'),
(60065, 1, 1008, 'weekday', '12:32:00', 'southbound'),
(60066, 1, 1008, 'weekday', '12:40:00', 'southbound'),
(60067, 1, 1008, 'weekday', '12:48:00', 'southbound'),
(60068, 1, 1008, 'weekday', '12:56:00', 'southbound'),
(60069, 1, 1008, 'weekday', '13:04:00', 'southbound'),
(60070, 1, 1008, 'weekday', '13:12:00', 'southbound');
-- Red Line @ 95th/Dan Ryan (1008) seq 5 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60071, 1, 1008, 'sunday_holiday', '14:00:00', 'southbound'),
(60072, 1, 1008, 'sunday_holiday', '14:20:00', 'southbound'),
(60073, 1, 1008, 'sunday_holiday', '14:40:00', 'southbound');
-- Red Line @ 95th/Dan Ryan (1008) seq 5 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60074, 1, 1008, 'saturday', '15:00:00', 'southbound'),
(60075, 1, 1008, 'saturday', '15:20:00', 'southbound');

-- Blue Line (2) - southbound
-- Blue Line @ O'Hare (1007) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60076, 2, 1007, 'weekday', '12:10:00', 'southbound'),
(60077, 2, 1007, 'weekday', '12:18:00', 'southbound'),
(60078, 2, 1007, 'weekday', '12:26:00', 'southbound'),
(60079, 2, 1007, 'weekday', '12:34:00', 'southbound'),
(60080, 2, 1007, 'weekday', '12:42:00', 'southbound'),
(60081, 2, 1007, 'weekday', '12:50:00', 'southbound'),
(60082, 2, 1007, 'weekday', '12:58:00', 'southbound'),
(60083, 2, 1007, 'weekday', '13:06:00', 'southbound'),
(60084, 2, 1007, 'weekday', '13:14:00', 'southbound'),
(60085, 2, 1007, 'weekday', '13:22:00', 'southbound');
-- Blue Line @ O'Hare (1007) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60086, 2, 1007, 'sunday_holiday', '14:10:00', 'southbound'),
(60087, 2, 1007, 'sunday_holiday', '14:30:00', 'southbound'),
(60088, 2, 1007, 'sunday_holiday', '14:50:00', 'southbound');
-- Blue Line @ O'Hare (1007) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60089, 2, 1007, 'saturday', '15:10:00', 'southbound'),
(60090, 2, 1007, 'saturday', '15:30:00', 'southbound');
-- Blue Line @ Clark/Lake (1006) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60091, 2, 1006, 'weekday', '12:05:00', 'southbound'),
(60092, 2, 1006, 'weekday', '12:13:00', 'southbound'),
(60093, 2, 1006, 'weekday', '12:21:00', 'southbound'),
(60094, 2, 1006, 'weekday', '12:29:00', 'southbound'),
(60095, 2, 1006, 'weekday', '12:37:00', 'southbound'),
(60096, 2, 1006, 'weekday', '12:45:00', 'southbound'),
(60097, 2, 1006, 'weekday', '12:53:00', 'southbound'),
(60098, 2, 1006, 'weekday', '13:01:00', 'southbound'),
(60099, 2, 1006, 'weekday', '13:09:00', 'southbound'),
(60100, 2, 1006, 'weekday', '13:17:00', 'southbound');
-- Blue Line @ Clark/Lake (1006) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60101, 2, 1006, 'sunday_holiday', '14:05:00', 'southbound'),
(60102, 2, 1006, 'sunday_holiday', '14:25:00', 'southbound'),
(60103, 2, 1006, 'sunday_holiday', '14:45:00', 'southbound');
-- Blue Line @ Clark/Lake (1006) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60104, 2, 1006, 'saturday', '15:05:00', 'southbound'),
(60105, 2, 1006, 'saturday', '15:25:00', 'southbound');
-- Blue Line @ Jackson (1004) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60106, 2, 1004, 'weekday', '12:00:00', 'southbound'),
(60107, 2, 1004, 'weekday', '12:08:00', 'southbound'),
(60108, 2, 1004, 'weekday', '12:16:00', 'southbound'),
(60109, 2, 1004, 'weekday', '12:24:00', 'southbound'),
(60110, 2, 1004, 'weekday', '12:32:00', 'southbound'),
(60111, 2, 1004, 'weekday', '12:40:00', 'southbound'),
(60112, 2, 1004, 'weekday', '12:48:00', 'southbound'),
(60113, 2, 1004, 'weekday', '12:56:00', 'southbound'),
(60114, 2, 1004, 'weekday', '13:04:00', 'southbound'),
(60115, 2, 1004, 'weekday', '13:12:00', 'southbound');
-- Blue Line @ Jackson (1004) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60116, 2, 1004, 'sunday_holiday', '14:00:00', 'southbound'),
(60117, 2, 1004, 'sunday_holiday', '14:20:00', 'southbound'),
(60118, 2, 1004, 'sunday_holiday', '14:40:00', 'southbound');
-- Blue Line @ Jackson (1004) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60119, 2, 1004, 'saturday', '15:00:00', 'southbound'),
(60120, 2, 1004, 'saturday', '15:20:00', 'southbound');

-- Brown Line (3) - southbound
-- Brown Line @ Belmont (1002) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60121, 3, 1002, 'weekday', '12:10:00', 'southbound'),
(60122, 3, 1002, 'weekday', '12:18:00', 'southbound'),
(60123, 3, 1002, 'weekday', '12:26:00', 'southbound'),
(60124, 3, 1002, 'weekday', '12:34:00', 'southbound'),
(60125, 3, 1002, 'weekday', '12:42:00', 'southbound'),
(60126, 3, 1002, 'weekday', '12:50:00', 'southbound'),
(60127, 3, 1002, 'weekday', '12:58:00', 'southbound'),
(60128, 3, 1002, 'weekday', '13:06:00', 'southbound'),
(60129, 3, 1002, 'weekday', '13:14:00', 'southbound'),
(60130, 3, 1002, 'weekday', '13:22:00', 'southbound');
-- Brown Line @ Belmont (1002) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60131, 3, 1002, 'sunday_holiday', '14:10:00', 'southbound'),
(60132, 3, 1002, 'sunday_holiday', '14:30:00', 'southbound'),
(60133, 3, 1002, 'sunday_holiday', '14:50:00', 'southbound');
-- Brown Line @ Belmont (1002) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60134, 3, 1002, 'saturday', '15:10:00', 'southbound'),
(60135, 3, 1002, 'saturday', '15:30:00', 'southbound');
-- Brown Line @ Fullerton (1003) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60136, 3, 1003, 'weekday', '12:05:00', 'southbound'),
(60137, 3, 1003, 'weekday', '12:13:00', 'southbound'),
(60138, 3, 1003, 'weekday', '12:21:00', 'southbound'),
(60139, 3, 1003, 'weekday', '12:29:00', 'southbound'),
(60140, 3, 1003, 'weekday', '12:37:00', 'southbound'),
(60141, 3, 1003, 'weekday', '12:45:00', 'southbound'),
(60142, 3, 1003, 'weekday', '12:53:00', 'southbound'),
(60143, 3, 1003, 'weekday', '13:01:00', 'southbound'),
(60144, 3, 1003, 'weekday', '13:09:00', 'southbound'),
(60145, 3, 1003, 'weekday', '13:17:00', 'southbound');
-- Brown Line @ Fullerton (1003) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60146, 3, 1003, 'sunday_holiday', '14:05:00', 'southbound'),
(60147, 3, 1003, 'sunday_holiday', '14:25:00', 'southbound'),
(60148, 3, 1003, 'sunday_holiday', '14:45:00', 'southbound');
-- Brown Line @ Fullerton (1003) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60149, 3, 1003, 'saturday', '15:05:00', 'southbound'),
(60150, 3, 1003, 'saturday', '15:25:00', 'southbound');
-- Brown Line @ Clark/Lake (1006) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60151, 3, 1006, 'weekday', '12:00:00', 'southbound'),
(60152, 3, 1006, 'weekday', '12:08:00', 'southbound'),
(60153, 3, 1006, 'weekday', '12:16:00', 'southbound'),
(60154, 3, 1006, 'weekday', '12:24:00', 'southbound'),
(60155, 3, 1006, 'weekday', '12:32:00', 'southbound'),
(60156, 3, 1006, 'weekday', '12:40:00', 'southbound'),
(60157, 3, 1006, 'weekday', '12:48:00', 'southbound'),
(60158, 3, 1006, 'weekday', '12:56:00', 'southbound'),
(60159, 3, 1006, 'weekday', '13:04:00', 'southbound'),
(60160, 3, 1006, 'weekday', '13:12:00', 'southbound');
-- Brown Line @ Clark/Lake (1006) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60161, 3, 1006, 'sunday_holiday', '14:00:00', 'southbound'),
(60162, 3, 1006, 'sunday_holiday', '14:20:00', 'southbound'),
(60163, 3, 1006, 'sunday_holiday', '14:40:00', 'southbound');
-- Brown Line @ Clark/Lake (1006) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60164, 3, 1006, 'saturday', '15:00:00', 'southbound'),
(60165, 3, 1006, 'saturday', '15:20:00', 'southbound');

-- Green Line (4) - southbound
-- Green Line @ Howard (1001) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60166, 4, 1001, 'weekday', '12:10:00', 'southbound'),
(60167, 4, 1001, 'weekday', '12:18:00', 'southbound'),
(60168, 4, 1001, 'weekday', '12:26:00', 'southbound'),
(60169, 4, 1001, 'weekday', '12:34:00', 'southbound'),
(60170, 4, 1001, 'weekday', '12:42:00', 'southbound'),
(60171, 4, 1001, 'weekday', '12:50:00', 'southbound'),
(60172, 4, 1001, 'weekday', '12:58:00', 'southbound'),
(60173, 4, 1001, 'weekday', '13:06:00', 'southbound'),
(60174, 4, 1001, 'weekday', '13:14:00', 'southbound'),
(60175, 4, 1001, 'weekday', '13:22:00', 'southbound');
-- Green Line @ Howard (1001) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60176, 4, 1001, 'sunday_holiday', '14:10:00', 'southbound'),
(60177, 4, 1001, 'sunday_holiday', '14:30:00', 'southbound'),
(60178, 4, 1001, 'sunday_holiday', '14:50:00', 'southbound');
-- Green Line @ Howard (1001) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60179, 4, 1001, 'saturday', '15:10:00', 'southbound'),
(60180, 4, 1001, 'saturday', '15:30:00', 'southbound');
-- Green Line @ Clark/Lake (1006) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60181, 4, 1006, 'weekday', '12:05:00', 'southbound'),
(60182, 4, 1006, 'weekday', '12:13:00', 'southbound'),
(60183, 4, 1006, 'weekday', '12:21:00', 'southbound'),
(60184, 4, 1006, 'weekday', '12:29:00', 'southbound'),
(60185, 4, 1006, 'weekday', '12:37:00', 'southbound'),
(60186, 4, 1006, 'weekday', '12:45:00', 'southbound'),
(60187, 4, 1006, 'weekday', '12:53:00', 'southbound'),
(60188, 4, 1006, 'weekday', '13:01:00', 'southbound'),
(60189, 4, 1006, 'weekday', '13:09:00', 'southbound'),
(60190, 4, 1006, 'weekday', '13:17:00', 'southbound');
-- Green Line @ Clark/Lake (1006) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60191, 4, 1006, 'sunday_holiday', '14:05:00', 'southbound'),
(60192, 4, 1006, 'sunday_holiday', '14:25:00', 'southbound'),
(60193, 4, 1006, 'sunday_holiday', '14:45:00', 'southbound');
-- Green Line @ Clark/Lake (1006) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60194, 4, 1006, 'saturday', '15:05:00', 'southbound'),
(60195, 4, 1006, 'saturday', '15:25:00', 'southbound');
-- Green Line @ Roosevelt (1005) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60196, 4, 1005, 'weekday', '12:00:00', 'southbound'),
(60197, 4, 1005, 'weekday', '12:08:00', 'southbound'),
(60198, 4, 1005, 'weekday', '12:16:00', 'southbound'),
(60199, 4, 1005, 'weekday', '12:24:00', 'southbound'),
(60200, 4, 1005, 'weekday', '12:32:00', 'southbound'),
(60201, 4, 1005, 'weekday', '12:40:00', 'southbound'),
(60202, 4, 1005, 'weekday', '12:48:00', 'southbound'),
(60203, 4, 1005, 'weekday', '12:56:00', 'southbound'),
(60204, 4, 1005, 'weekday', '13:04:00', 'southbound'),
(60205, 4, 1005, 'weekday', '13:12:00', 'southbound');
-- Green Line @ Roosevelt (1005) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60206, 4, 1005, 'sunday_holiday', '14:00:00', 'southbound'),
(60207, 4, 1005, 'sunday_holiday', '14:20:00', 'southbound'),
(60208, 4, 1005, 'sunday_holiday', '14:40:00', 'southbound');
-- Green Line @ Roosevelt (1005) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60209, 4, 1005, 'saturday', '15:00:00', 'southbound'),
(60210, 4, 1005, 'saturday', '15:20:00', 'southbound');

-- Orange Line (5) - southbound
-- Orange Line @ Roosevelt (1005) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60211, 5, 1005, 'weekday', '12:10:00', 'southbound'),
(60212, 5, 1005, 'weekday', '12:18:00', 'southbound'),
(60213, 5, 1005, 'weekday', '12:26:00', 'southbound'),
(60214, 5, 1005, 'weekday', '12:34:00', 'southbound'),
(60215, 5, 1005, 'weekday', '12:42:00', 'southbound'),
(60216, 5, 1005, 'weekday', '12:50:00', 'southbound'),
(60217, 5, 1005, 'weekday', '12:58:00', 'southbound'),
(60218, 5, 1005, 'weekday', '13:06:00', 'southbound'),
(60219, 5, 1005, 'weekday', '13:14:00', 'southbound'),
(60220, 5, 1005, 'weekday', '13:22:00', 'southbound');
-- Orange Line @ Roosevelt (1005) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60221, 5, 1005, 'sunday_holiday', '14:10:00', 'southbound'),
(60222, 5, 1005, 'sunday_holiday', '14:30:00', 'southbound'),
(60223, 5, 1005, 'sunday_holiday', '14:50:00', 'southbound');
-- Orange Line @ Roosevelt (1005) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60224, 5, 1005, 'saturday', '15:10:00', 'southbound'),
(60225, 5, 1005, 'saturday', '15:30:00', 'southbound');
-- Orange Line @ Cermak-Chinatown (1009) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60226, 5, 1009, 'weekday', '12:05:00', 'southbound'),
(60227, 5, 1009, 'weekday', '12:13:00', 'southbound'),
(60228, 5, 1009, 'weekday', '12:21:00', 'southbound'),
(60229, 5, 1009, 'weekday', '12:29:00', 'southbound'),
(60230, 5, 1009, 'weekday', '12:37:00', 'southbound'),
(60231, 5, 1009, 'weekday', '12:45:00', 'southbound'),
(60232, 5, 1009, 'weekday', '12:53:00', 'southbound'),
(60233, 5, 1009, 'weekday', '13:01:00', 'southbound'),
(60234, 5, 1009, 'weekday', '13:09:00', 'southbound'),
(60235, 5, 1009, 'weekday', '13:17:00', 'southbound');
-- Orange Line @ Cermak-Chinatown (1009) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60236, 5, 1009, 'sunday_holiday', '14:05:00', 'southbound'),
(60237, 5, 1009, 'sunday_holiday', '14:25:00', 'southbound'),
(60238, 5, 1009, 'sunday_holiday', '14:45:00', 'southbound');
-- Orange Line @ Cermak-Chinatown (1009) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60239, 5, 1009, 'saturday', '15:05:00', 'southbound'),
(60240, 5, 1009, 'saturday', '15:25:00', 'southbound');
-- Orange Line @ Sox-35th (1010) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60241, 5, 1010, 'weekday', '12:00:00', 'southbound'),
(60242, 5, 1010, 'weekday', '12:08:00', 'southbound'),
(60243, 5, 1010, 'weekday', '12:16:00', 'southbound'),
(60244, 5, 1010, 'weekday', '12:24:00', 'southbound'),
(60245, 5, 1010, 'weekday', '12:32:00', 'southbound'),
(60246, 5, 1010, 'weekday', '12:40:00', 'southbound'),
(60247, 5, 1010, 'weekday', '12:48:00', 'southbound'),
(60248, 5, 1010, 'weekday', '12:56:00', 'southbound'),
(60249, 5, 1010, 'weekday', '13:04:00', 'southbound'),
(60250, 5, 1010, 'weekday', '13:12:00', 'southbound');
-- Orange Line @ Sox-35th (1010) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60251, 5, 1010, 'sunday_holiday', '14:00:00', 'southbound'),
(60252, 5, 1010, 'sunday_holiday', '14:20:00', 'southbound'),
(60253, 5, 1010, 'sunday_holiday', '14:40:00', 'southbound');
-- Orange Line @ Sox-35th (1010) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60254, 5, 1010, 'saturday', '15:00:00', 'southbound'),
(60255, 5, 1010, 'saturday', '15:20:00', 'southbound');

-- Purple Line (6) - southbound
-- Purple Line @ Howard (1001) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60256, 6, 1001, 'weekday', '12:10:00', 'southbound'),
(60257, 6, 1001, 'weekday', '12:18:00', 'southbound'),
(60258, 6, 1001, 'weekday', '12:26:00', 'southbound'),
(60259, 6, 1001, 'weekday', '12:34:00', 'southbound'),
(60260, 6, 1001, 'weekday', '12:42:00', 'southbound'),
(60261, 6, 1001, 'weekday', '12:50:00', 'southbound'),
(60262, 6, 1001, 'weekday', '12:58:00', 'southbound'),
(60263, 6, 1001, 'weekday', '13:06:00', 'southbound'),
(60264, 6, 1001, 'weekday', '13:14:00', 'southbound'),
(60265, 6, 1001, 'weekday', '13:22:00', 'southbound');
-- Purple Line @ Howard (1001) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60266, 6, 1001, 'sunday_holiday', '14:10:00', 'southbound'),
(60267, 6, 1001, 'sunday_holiday', '14:30:00', 'southbound'),
(60268, 6, 1001, 'sunday_holiday', '14:50:00', 'southbound');
-- Purple Line @ Howard (1001) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60269, 6, 1001, 'saturday', '15:10:00', 'southbound'),
(60270, 6, 1001, 'saturday', '15:30:00', 'southbound');
-- Purple Line @ Belmont (1002) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60271, 6, 1002, 'weekday', '12:05:00', 'southbound'),
(60272, 6, 1002, 'weekday', '12:13:00', 'southbound'),
(60273, 6, 1002, 'weekday', '12:21:00', 'southbound'),
(60274, 6, 1002, 'weekday', '12:29:00', 'southbound'),
(60275, 6, 1002, 'weekday', '12:37:00', 'southbound'),
(60276, 6, 1002, 'weekday', '12:45:00', 'southbound'),
(60277, 6, 1002, 'weekday', '12:53:00', 'southbound'),
(60278, 6, 1002, 'weekday', '13:01:00', 'southbound'),
(60279, 6, 1002, 'weekday', '13:09:00', 'southbound'),
(60280, 6, 1002, 'weekday', '13:17:00', 'southbound');
-- Purple Line @ Belmont (1002) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60281, 6, 1002, 'sunday_holiday', '14:05:00', 'southbound'),
(60282, 6, 1002, 'sunday_holiday', '14:25:00', 'southbound'),
(60283, 6, 1002, 'sunday_holiday', '14:45:00', 'southbound');
-- Purple Line @ Belmont (1002) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60284, 6, 1002, 'saturday', '15:05:00', 'southbound'),
(60285, 6, 1002, 'saturday', '15:25:00', 'southbound');
-- Purple Line @ Fullerton (1003) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60286, 6, 1003, 'weekday', '12:00:00', 'southbound'),
(60287, 6, 1003, 'weekday', '12:08:00', 'southbound'),
(60288, 6, 1003, 'weekday', '12:16:00', 'southbound'),
(60289, 6, 1003, 'weekday', '12:24:00', 'southbound'),
(60290, 6, 1003, 'weekday', '12:32:00', 'southbound'),
(60291, 6, 1003, 'weekday', '12:40:00', 'southbound'),
(60292, 6, 1003, 'weekday', '12:48:00', 'southbound'),
(60293, 6, 1003, 'weekday', '12:56:00', 'southbound'),
(60294, 6, 1003, 'weekday', '13:04:00', 'southbound'),
(60295, 6, 1003, 'weekday', '13:12:00', 'southbound');
-- Purple Line @ Fullerton (1003) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60296, 6, 1003, 'sunday_holiday', '14:00:00', 'southbound'),
(60297, 6, 1003, 'sunday_holiday', '14:20:00', 'southbound'),
(60298, 6, 1003, 'sunday_holiday', '14:40:00', 'southbound');
-- Purple Line @ Fullerton (1003) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60299, 6, 1003, 'saturday', '15:00:00', 'southbound'),
(60300, 6, 1003, 'saturday', '15:20:00', 'southbound');

-- Pink Line (7) - southbound
-- Pink Line @ Fullerton (1003) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60301, 7, 1003, 'weekday', '12:10:00', 'southbound'),
(60302, 7, 1003, 'weekday', '12:18:00', 'southbound'),
(60303, 7, 1003, 'weekday', '12:26:00', 'southbound'),
(60304, 7, 1003, 'weekday', '12:34:00', 'southbound'),
(60305, 7, 1003, 'weekday', '12:42:00', 'southbound'),
(60306, 7, 1003, 'weekday', '12:50:00', 'southbound'),
(60307, 7, 1003, 'weekday', '12:58:00', 'southbound'),
(60308, 7, 1003, 'weekday', '13:06:00', 'southbound'),
(60309, 7, 1003, 'weekday', '13:14:00', 'southbound'),
(60310, 7, 1003, 'weekday', '13:22:00', 'southbound');
-- Pink Line @ Fullerton (1003) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60311, 7, 1003, 'sunday_holiday', '14:10:00', 'southbound'),
(60312, 7, 1003, 'sunday_holiday', '14:30:00', 'southbound'),
(60313, 7, 1003, 'sunday_holiday', '14:50:00', 'southbound');
-- Pink Line @ Fullerton (1003) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60314, 7, 1003, 'saturday', '15:10:00', 'southbound'),
(60315, 7, 1003, 'saturday', '15:30:00', 'southbound');
-- Pink Line @ Clark/Lake (1006) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60316, 7, 1006, 'weekday', '12:05:00', 'southbound'),
(60317, 7, 1006, 'weekday', '12:13:00', 'southbound'),
(60318, 7, 1006, 'weekday', '12:21:00', 'southbound'),
(60319, 7, 1006, 'weekday', '12:29:00', 'southbound'),
(60320, 7, 1006, 'weekday', '12:37:00', 'southbound'),
(60321, 7, 1006, 'weekday', '12:45:00', 'southbound'),
(60322, 7, 1006, 'weekday', '12:53:00', 'southbound'),
(60323, 7, 1006, 'weekday', '13:01:00', 'southbound'),
(60324, 7, 1006, 'weekday', '13:09:00', 'southbound'),
(60325, 7, 1006, 'weekday', '13:17:00', 'southbound');
-- Pink Line @ Clark/Lake (1006) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60326, 7, 1006, 'sunday_holiday', '14:05:00', 'southbound'),
(60327, 7, 1006, 'sunday_holiday', '14:25:00', 'southbound'),
(60328, 7, 1006, 'sunday_holiday', '14:45:00', 'southbound');
-- Pink Line @ Clark/Lake (1006) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60329, 7, 1006, 'saturday', '15:05:00', 'southbound'),
(60330, 7, 1006, 'saturday', '15:25:00', 'southbound');
-- Pink Line @ Roosevelt (1005) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60331, 7, 1005, 'weekday', '12:00:00', 'southbound'),
(60332, 7, 1005, 'weekday', '12:08:00', 'southbound'),
(60333, 7, 1005, 'weekday', '12:16:00', 'southbound'),
(60334, 7, 1005, 'weekday', '12:24:00', 'southbound'),
(60335, 7, 1005, 'weekday', '12:32:00', 'southbound'),
(60336, 7, 1005, 'weekday', '12:40:00', 'southbound'),
(60337, 7, 1005, 'weekday', '12:48:00', 'southbound'),
(60338, 7, 1005, 'weekday', '12:56:00', 'southbound'),
(60339, 7, 1005, 'weekday', '13:04:00', 'southbound'),
(60340, 7, 1005, 'weekday', '13:12:00', 'southbound');
-- Pink Line @ Roosevelt (1005) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60341, 7, 1005, 'sunday_holiday', '14:00:00', 'southbound'),
(60342, 7, 1005, 'sunday_holiday', '14:20:00', 'southbound'),
(60343, 7, 1005, 'sunday_holiday', '14:40:00', 'southbound');
-- Pink Line @ Roosevelt (1005) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60344, 7, 1005, 'saturday', '15:00:00', 'southbound'),
(60345, 7, 1005, 'saturday', '15:20:00', 'southbound');

-- Yellow Line (8) - southbound
-- Yellow Line @ Howard (1001) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60346, 8, 1001, 'weekday', '12:10:00', 'southbound'),
(60347, 8, 1001, 'weekday', '12:18:00', 'southbound'),
(60348, 8, 1001, 'weekday', '12:26:00', 'southbound'),
(60349, 8, 1001, 'weekday', '12:34:00', 'southbound'),
(60350, 8, 1001, 'weekday', '12:42:00', 'southbound'),
(60351, 8, 1001, 'weekday', '12:50:00', 'southbound'),
(60352, 8, 1001, 'weekday', '12:58:00', 'southbound'),
(60353, 8, 1001, 'weekday', '13:06:00', 'southbound'),
(60354, 8, 1001, 'weekday', '13:14:00', 'southbound'),
(60355, 8, 1001, 'weekday', '13:22:00', 'southbound');
-- Yellow Line @ Howard (1001) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60356, 8, 1001, 'sunday_holiday', '14:10:00', 'southbound'),
(60357, 8, 1001, 'sunday_holiday', '14:30:00', 'southbound'),
(60358, 8, 1001, 'sunday_holiday', '14:50:00', 'southbound');
-- Yellow Line @ Howard (1001) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60359, 8, 1001, 'saturday', '15:10:00', 'southbound'),
(60360, 8, 1001, 'saturday', '15:30:00', 'southbound');
-- Yellow Line @ Clark/Lake (1006) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60361, 8, 1006, 'weekday', '12:05:00', 'southbound'),
(60362, 8, 1006, 'weekday', '12:13:00', 'southbound'),
(60363, 8, 1006, 'weekday', '12:21:00', 'southbound'),
(60364, 8, 1006, 'weekday', '12:29:00', 'southbound'),
(60365, 8, 1006, 'weekday', '12:37:00', 'southbound'),
(60366, 8, 1006, 'weekday', '12:45:00', 'southbound'),
(60367, 8, 1006, 'weekday', '12:53:00', 'southbound'),
(60368, 8, 1006, 'weekday', '13:01:00', 'southbound'),
(60369, 8, 1006, 'weekday', '13:09:00', 'southbound'),
(60370, 8, 1006, 'weekday', '13:17:00', 'southbound');
-- Yellow Line @ Clark/Lake (1006) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60371, 8, 1006, 'sunday_holiday', '14:05:00', 'southbound'),
(60372, 8, 1006, 'sunday_holiday', '14:25:00', 'southbound'),
(60373, 8, 1006, 'sunday_holiday', '14:45:00', 'southbound');
-- Yellow Line @ Clark/Lake (1006) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60374, 8, 1006, 'saturday', '15:05:00', 'southbound'),
(60375, 8, 1006, 'saturday', '15:25:00', 'southbound');
-- Yellow Line @ Jackson (1004) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60376, 8, 1004, 'weekday', '12:00:00', 'southbound'),
(60377, 8, 1004, 'weekday', '12:08:00', 'southbound'),
(60378, 8, 1004, 'weekday', '12:16:00', 'southbound'),
(60379, 8, 1004, 'weekday', '12:24:00', 'southbound'),
(60380, 8, 1004, 'weekday', '12:32:00', 'southbound'),
(60381, 8, 1004, 'weekday', '12:40:00', 'southbound'),
(60382, 8, 1004, 'weekday', '12:48:00', 'southbound'),
(60383, 8, 1004, 'weekday', '12:56:00', 'southbound'),
(60384, 8, 1004, 'weekday', '13:04:00', 'southbound'),
(60385, 8, 1004, 'weekday', '13:12:00', 'southbound');
-- Yellow Line @ Jackson (1004) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60386, 8, 1004, 'sunday_holiday', '14:00:00', 'southbound'),
(60387, 8, 1004, 'sunday_holiday', '14:20:00', 'southbound'),
(60388, 8, 1004, 'sunday_holiday', '14:40:00', 'southbound');
-- Yellow Line @ Jackson (1004) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60389, 8, 1004, 'saturday', '15:00:00', 'southbound'),
(60390, 8, 1004, 'saturday', '15:20:00', 'southbound');

-- 8 Halsted (9) - southbound
-- 8 Halsted @ Halsted/79th (1011) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60391, 9, 1011, 'weekday', '12:10:00', 'southbound'),
(60392, 9, 1011, 'weekday', '12:18:00', 'southbound'),
(60393, 9, 1011, 'weekday', '12:26:00', 'southbound'),
(60394, 9, 1011, 'weekday', '12:34:00', 'southbound'),
(60395, 9, 1011, 'weekday', '12:42:00', 'southbound'),
(60396, 9, 1011, 'weekday', '12:50:00', 'southbound'),
(60397, 9, 1011, 'weekday', '12:58:00', 'southbound'),
(60398, 9, 1011, 'weekday', '13:06:00', 'southbound'),
(60399, 9, 1011, 'weekday', '13:14:00', 'southbound'),
(60400, 9, 1011, 'weekday', '13:22:00', 'southbound');
-- 8 Halsted @ Halsted/79th (1011) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60401, 9, 1011, 'sunday_holiday', '14:10:00', 'southbound'),
(60402, 9, 1011, 'sunday_holiday', '14:30:00', 'southbound'),
(60403, 9, 1011, 'sunday_holiday', '14:50:00', 'southbound');
-- 8 Halsted @ Halsted/79th (1011) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60404, 9, 1011, 'saturday', '15:10:00', 'southbound'),
(60405, 9, 1011, 'saturday', '15:30:00', 'southbound');
-- 8 Halsted @ Broadway/Waveland (1012) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60406, 9, 1012, 'weekday', '12:05:00', 'southbound'),
(60407, 9, 1012, 'weekday', '12:13:00', 'southbound'),
(60408, 9, 1012, 'weekday', '12:21:00', 'southbound'),
(60409, 9, 1012, 'weekday', '12:29:00', 'southbound'),
(60410, 9, 1012, 'weekday', '12:37:00', 'southbound'),
(60411, 9, 1012, 'weekday', '12:45:00', 'southbound'),
(60412, 9, 1012, 'weekday', '12:53:00', 'southbound'),
(60413, 9, 1012, 'weekday', '13:01:00', 'southbound'),
(60414, 9, 1012, 'weekday', '13:09:00', 'southbound'),
(60415, 9, 1012, 'weekday', '13:17:00', 'southbound');
-- 8 Halsted @ Broadway/Waveland (1012) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60416, 9, 1012, 'sunday_holiday', '14:05:00', 'southbound'),
(60417, 9, 1012, 'sunday_holiday', '14:25:00', 'southbound'),
(60418, 9, 1012, 'sunday_holiday', '14:45:00', 'southbound');
-- 8 Halsted @ Broadway/Waveland (1012) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60419, 9, 1012, 'saturday', '15:05:00', 'southbound'),
(60420, 9, 1012, 'saturday', '15:25:00', 'southbound');
-- 8 Halsted @ Ashland/63rd (1013) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60421, 9, 1013, 'weekday', '12:00:00', 'southbound'),
(60422, 9, 1013, 'weekday', '12:08:00', 'southbound'),
(60423, 9, 1013, 'weekday', '12:16:00', 'southbound'),
(60424, 9, 1013, 'weekday', '12:24:00', 'southbound'),
(60425, 9, 1013, 'weekday', '12:32:00', 'southbound'),
(60426, 9, 1013, 'weekday', '12:40:00', 'southbound'),
(60427, 9, 1013, 'weekday', '12:48:00', 'southbound'),
(60428, 9, 1013, 'weekday', '12:56:00', 'southbound'),
(60429, 9, 1013, 'weekday', '13:04:00', 'southbound'),
(60430, 9, 1013, 'weekday', '13:12:00', 'southbound');
-- 8 Halsted @ Ashland/63rd (1013) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60431, 9, 1013, 'sunday_holiday', '14:00:00', 'southbound'),
(60432, 9, 1013, 'sunday_holiday', '14:20:00', 'southbound'),
(60433, 9, 1013, 'sunday_holiday', '14:40:00', 'southbound');
-- 8 Halsted @ Ashland/63rd (1013) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60434, 9, 1013, 'saturday', '15:00:00', 'southbound'),
(60435, 9, 1013, 'saturday', '15:20:00', 'southbound');

-- 9 Ashland (10) - southbound
-- 9 Ashland @ Ashland/63rd (1013) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60436, 10, 1013, 'weekday', '12:10:00', 'southbound'),
(60437, 10, 1013, 'weekday', '12:18:00', 'southbound'),
(60438, 10, 1013, 'weekday', '12:26:00', 'southbound'),
(60439, 10, 1013, 'weekday', '12:34:00', 'southbound'),
(60440, 10, 1013, 'weekday', '12:42:00', 'southbound'),
(60441, 10, 1013, 'weekday', '12:50:00', 'southbound'),
(60442, 10, 1013, 'weekday', '12:58:00', 'southbound'),
(60443, 10, 1013, 'weekday', '13:06:00', 'southbound'),
(60444, 10, 1013, 'weekday', '13:14:00', 'southbound'),
(60445, 10, 1013, 'weekday', '13:22:00', 'southbound');
-- 9 Ashland @ Ashland/63rd (1013) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60446, 10, 1013, 'sunday_holiday', '14:10:00', 'southbound'),
(60447, 10, 1013, 'sunday_holiday', '14:30:00', 'southbound'),
(60448, 10, 1013, 'sunday_holiday', '14:50:00', 'southbound');
-- 9 Ashland @ Ashland/63rd (1013) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60449, 10, 1013, 'saturday', '15:10:00', 'southbound'),
(60450, 10, 1013, 'saturday', '15:30:00', 'southbound');
-- 9 Ashland @ Roosevelt (1005) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60451, 10, 1005, 'weekday', '12:05:00', 'southbound'),
(60452, 10, 1005, 'weekday', '12:13:00', 'southbound'),
(60453, 10, 1005, 'weekday', '12:21:00', 'southbound'),
(60454, 10, 1005, 'weekday', '12:29:00', 'southbound'),
(60455, 10, 1005, 'weekday', '12:37:00', 'southbound'),
(60456, 10, 1005, 'weekday', '12:45:00', 'southbound'),
(60457, 10, 1005, 'weekday', '12:53:00', 'southbound'),
(60458, 10, 1005, 'weekday', '13:01:00', 'southbound'),
(60459, 10, 1005, 'weekday', '13:09:00', 'southbound'),
(60460, 10, 1005, 'weekday', '13:17:00', 'southbound');
-- 9 Ashland @ Roosevelt (1005) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60461, 10, 1005, 'sunday_holiday', '14:05:00', 'southbound'),
(60462, 10, 1005, 'sunday_holiday', '14:25:00', 'southbound'),
(60463, 10, 1005, 'sunday_holiday', '14:45:00', 'southbound');
-- 9 Ashland @ Roosevelt (1005) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60464, 10, 1005, 'saturday', '15:05:00', 'southbound'),
(60465, 10, 1005, 'saturday', '15:25:00', 'southbound');
-- 9 Ashland @ Michigan/Chicago (1014) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60466, 10, 1014, 'weekday', '12:00:00', 'southbound'),
(60467, 10, 1014, 'weekday', '12:08:00', 'southbound'),
(60468, 10, 1014, 'weekday', '12:16:00', 'southbound'),
(60469, 10, 1014, 'weekday', '12:24:00', 'southbound'),
(60470, 10, 1014, 'weekday', '12:32:00', 'southbound'),
(60471, 10, 1014, 'weekday', '12:40:00', 'southbound'),
(60472, 10, 1014, 'weekday', '12:48:00', 'southbound'),
(60473, 10, 1014, 'weekday', '12:56:00', 'southbound'),
(60474, 10, 1014, 'weekday', '13:04:00', 'southbound'),
(60475, 10, 1014, 'weekday', '13:12:00', 'southbound');
-- 9 Ashland @ Michigan/Chicago (1014) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60476, 10, 1014, 'sunday_holiday', '14:00:00', 'southbound'),
(60477, 10, 1014, 'sunday_holiday', '14:20:00', 'southbound'),
(60478, 10, 1014, 'sunday_holiday', '14:40:00', 'southbound');
-- 9 Ashland @ Michigan/Chicago (1014) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60479, 10, 1014, 'saturday', '15:00:00', 'southbound'),
(60480, 10, 1014, 'saturday', '15:20:00', 'southbound');

-- 20 Madison (11) - southbound
-- 20 Madison @ Halsted/79th (1011) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60481, 11, 1011, 'weekday', '12:10:00', 'southbound'),
(60482, 11, 1011, 'weekday', '12:18:00', 'southbound'),
(60483, 11, 1011, 'weekday', '12:26:00', 'southbound'),
(60484, 11, 1011, 'weekday', '12:34:00', 'southbound'),
(60485, 11, 1011, 'weekday', '12:42:00', 'southbound'),
(60486, 11, 1011, 'weekday', '12:50:00', 'southbound'),
(60487, 11, 1011, 'weekday', '12:58:00', 'southbound'),
(60488, 11, 1011, 'weekday', '13:06:00', 'southbound'),
(60489, 11, 1011, 'weekday', '13:14:00', 'southbound'),
(60490, 11, 1011, 'weekday', '13:22:00', 'southbound');
-- 20 Madison @ Halsted/79th (1011) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60491, 11, 1011, 'sunday_holiday', '14:10:00', 'southbound'),
(60492, 11, 1011, 'sunday_holiday', '14:30:00', 'southbound'),
(60493, 11, 1011, 'sunday_holiday', '14:50:00', 'southbound');
-- 20 Madison @ Halsted/79th (1011) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60494, 11, 1011, 'saturday', '15:10:00', 'southbound'),
(60495, 11, 1011, 'saturday', '15:30:00', 'southbound');
-- 20 Madison @ Broadway/Waveland (1012) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60496, 11, 1012, 'weekday', '12:05:00', 'southbound'),
(60497, 11, 1012, 'weekday', '12:13:00', 'southbound'),
(60498, 11, 1012, 'weekday', '12:21:00', 'southbound'),
(60499, 11, 1012, 'weekday', '12:29:00', 'southbound'),
(60500, 11, 1012, 'weekday', '12:37:00', 'southbound'),
(60501, 11, 1012, 'weekday', '12:45:00', 'southbound'),
(60502, 11, 1012, 'weekday', '12:53:00', 'southbound'),
(60503, 11, 1012, 'weekday', '13:01:00', 'southbound'),
(60504, 11, 1012, 'weekday', '13:09:00', 'southbound'),
(60505, 11, 1012, 'weekday', '13:17:00', 'southbound');
-- 20 Madison @ Broadway/Waveland (1012) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60506, 11, 1012, 'sunday_holiday', '14:05:00', 'southbound'),
(60507, 11, 1012, 'sunday_holiday', '14:25:00', 'southbound'),
(60508, 11, 1012, 'sunday_holiday', '14:45:00', 'southbound');
-- 20 Madison @ Broadway/Waveland (1012) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60509, 11, 1012, 'saturday', '15:05:00', 'southbound'),
(60510, 11, 1012, 'saturday', '15:25:00', 'southbound');
-- 20 Madison @ Ashland/63rd (1013) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60511, 11, 1013, 'weekday', '12:00:00', 'southbound'),
(60512, 11, 1013, 'weekday', '12:08:00', 'southbound'),
(60513, 11, 1013, 'weekday', '12:16:00', 'southbound'),
(60514, 11, 1013, 'weekday', '12:24:00', 'southbound'),
(60515, 11, 1013, 'weekday', '12:32:00', 'southbound'),
(60516, 11, 1013, 'weekday', '12:40:00', 'southbound'),
(60517, 11, 1013, 'weekday', '12:48:00', 'southbound'),
(60518, 11, 1013, 'weekday', '12:56:00', 'southbound'),
(60519, 11, 1013, 'weekday', '13:04:00', 'southbound'),
(60520, 11, 1013, 'weekday', '13:12:00', 'southbound');
-- 20 Madison @ Ashland/63rd (1013) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60521, 11, 1013, 'sunday_holiday', '14:00:00', 'southbound'),
(60522, 11, 1013, 'sunday_holiday', '14:20:00', 'southbound'),
(60523, 11, 1013, 'sunday_holiday', '14:40:00', 'southbound');
-- 20 Madison @ Ashland/63rd (1013) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60524, 11, 1013, 'saturday', '15:00:00', 'southbound'),
(60525, 11, 1013, 'saturday', '15:20:00', 'southbound');

-- 22 Clark (12) - southbound
-- 22 Clark @ Halsted/79th (1011) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60526, 12, 1011, 'weekday', '12:10:00', 'southbound'),
(60527, 12, 1011, 'weekday', '12:18:00', 'southbound'),
(60528, 12, 1011, 'weekday', '12:26:00', 'southbound'),
(60529, 12, 1011, 'weekday', '12:34:00', 'southbound'),
(60530, 12, 1011, 'weekday', '12:42:00', 'southbound'),
(60531, 12, 1011, 'weekday', '12:50:00', 'southbound'),
(60532, 12, 1011, 'weekday', '12:58:00', 'southbound'),
(60533, 12, 1011, 'weekday', '13:06:00', 'southbound'),
(60534, 12, 1011, 'weekday', '13:14:00', 'southbound'),
(60535, 12, 1011, 'weekday', '13:22:00', 'southbound');
-- 22 Clark @ Halsted/79th (1011) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60536, 12, 1011, 'sunday_holiday', '14:10:00', 'southbound'),
(60537, 12, 1011, 'sunday_holiday', '14:30:00', 'southbound'),
(60538, 12, 1011, 'sunday_holiday', '14:50:00', 'southbound');
-- 22 Clark @ Halsted/79th (1011) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60539, 12, 1011, 'saturday', '15:10:00', 'southbound'),
(60540, 12, 1011, 'saturday', '15:30:00', 'southbound');
-- 22 Clark @ Navy Pier Terminal (1015) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60541, 12, 1015, 'weekday', '12:05:00', 'southbound'),
(60542, 12, 1015, 'weekday', '12:13:00', 'southbound'),
(60543, 12, 1015, 'weekday', '12:21:00', 'southbound'),
(60544, 12, 1015, 'weekday', '12:29:00', 'southbound'),
(60545, 12, 1015, 'weekday', '12:37:00', 'southbound'),
(60546, 12, 1015, 'weekday', '12:45:00', 'southbound'),
(60547, 12, 1015, 'weekday', '12:53:00', 'southbound'),
(60548, 12, 1015, 'weekday', '13:01:00', 'southbound'),
(60549, 12, 1015, 'weekday', '13:09:00', 'southbound'),
(60550, 12, 1015, 'weekday', '13:17:00', 'southbound');
-- 22 Clark @ Navy Pier Terminal (1015) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60551, 12, 1015, 'sunday_holiday', '14:05:00', 'southbound'),
(60552, 12, 1015, 'sunday_holiday', '14:25:00', 'southbound'),
(60553, 12, 1015, 'sunday_holiday', '14:45:00', 'southbound');
-- 22 Clark @ Navy Pier Terminal (1015) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60554, 12, 1015, 'saturday', '15:05:00', 'southbound'),
(60555, 12, 1015, 'saturday', '15:25:00', 'southbound');
-- 22 Clark @ Ashland/63rd (1013) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60556, 12, 1013, 'weekday', '12:00:00', 'southbound'),
(60557, 12, 1013, 'weekday', '12:08:00', 'southbound'),
(60558, 12, 1013, 'weekday', '12:16:00', 'southbound'),
(60559, 12, 1013, 'weekday', '12:24:00', 'southbound'),
(60560, 12, 1013, 'weekday', '12:32:00', 'southbound'),
(60561, 12, 1013, 'weekday', '12:40:00', 'southbound'),
(60562, 12, 1013, 'weekday', '12:48:00', 'southbound'),
(60563, 12, 1013, 'weekday', '12:56:00', 'southbound'),
(60564, 12, 1013, 'weekday', '13:04:00', 'southbound'),
(60565, 12, 1013, 'weekday', '13:12:00', 'southbound');
-- 22 Clark @ Ashland/63rd (1013) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60566, 12, 1013, 'sunday_holiday', '14:00:00', 'southbound'),
(60567, 12, 1013, 'sunday_holiday', '14:20:00', 'southbound'),
(60568, 12, 1013, 'sunday_holiday', '14:40:00', 'southbound');
-- 22 Clark @ Ashland/63rd (1013) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60569, 12, 1013, 'saturday', '15:00:00', 'southbound'),
(60570, 12, 1013, 'saturday', '15:20:00', 'southbound');

-- 36 Broadway (13) - southbound
-- 36 Broadway @ Halsted/79th (1011) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60571, 13, 1011, 'weekday', '12:20:00', 'southbound'),
(60572, 13, 1011, 'weekday', '12:28:00', 'southbound'),
(60573, 13, 1011, 'weekday', '12:36:00', 'southbound'),
(60574, 13, 1011, 'weekday', '12:44:00', 'southbound'),
(60575, 13, 1011, 'weekday', '12:52:00', 'southbound'),
(60576, 13, 1011, 'weekday', '13:00:00', 'southbound'),
(60577, 13, 1011, 'weekday', '13:08:00', 'southbound'),
(60578, 13, 1011, 'weekday', '13:16:00', 'southbound'),
(60579, 13, 1011, 'weekday', '13:24:00', 'southbound'),
(60580, 13, 1011, 'weekday', '13:32:00', 'southbound');
-- 36 Broadway @ Halsted/79th (1011) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60581, 13, 1011, 'sunday_holiday', '14:20:00', 'southbound'),
(60582, 13, 1011, 'sunday_holiday', '14:40:00', 'southbound'),
(60583, 13, 1011, 'sunday_holiday', '15:00:00', 'southbound');
-- 36 Broadway @ Halsted/79th (1011) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60584, 13, 1011, 'saturday', '15:20:00', 'southbound'),
(60585, 13, 1011, 'saturday', '15:40:00', 'southbound');
-- 36 Broadway @ Broadway/Waveland (1012) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60586, 13, 1012, 'weekday', '12:15:00', 'southbound'),
(60587, 13, 1012, 'weekday', '12:23:00', 'southbound'),
(60588, 13, 1012, 'weekday', '12:31:00', 'southbound'),
(60589, 13, 1012, 'weekday', '12:39:00', 'southbound'),
(60590, 13, 1012, 'weekday', '12:47:00', 'southbound'),
(60591, 13, 1012, 'weekday', '12:55:00', 'southbound'),
(60592, 13, 1012, 'weekday', '13:03:00', 'southbound'),
(60593, 13, 1012, 'weekday', '13:11:00', 'southbound'),
(60594, 13, 1012, 'weekday', '13:19:00', 'southbound'),
(60595, 13, 1012, 'weekday', '13:27:00', 'southbound');
-- 36 Broadway @ Broadway/Waveland (1012) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60596, 13, 1012, 'sunday_holiday', '14:15:00', 'southbound'),
(60597, 13, 1012, 'sunday_holiday', '14:35:00', 'southbound'),
(60598, 13, 1012, 'sunday_holiday', '14:55:00', 'southbound');
-- 36 Broadway @ Broadway/Waveland (1012) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60599, 13, 1012, 'saturday', '15:15:00', 'southbound'),
(60600, 13, 1012, 'saturday', '15:35:00', 'southbound');
-- 36 Broadway @ Ashland/63rd (1013) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60601, 13, 1013, 'weekday', '12:10:00', 'southbound'),
(60602, 13, 1013, 'weekday', '12:18:00', 'southbound'),
(60603, 13, 1013, 'weekday', '12:26:00', 'southbound'),
(60604, 13, 1013, 'weekday', '12:34:00', 'southbound'),
(60605, 13, 1013, 'weekday', '12:42:00', 'southbound'),
(60606, 13, 1013, 'weekday', '12:50:00', 'southbound'),
(60607, 13, 1013, 'weekday', '12:58:00', 'southbound'),
(60608, 13, 1013, 'weekday', '13:06:00', 'southbound'),
(60609, 13, 1013, 'weekday', '13:14:00', 'southbound'),
(60610, 13, 1013, 'weekday', '13:22:00', 'southbound');
-- 36 Broadway @ Ashland/63rd (1013) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60611, 13, 1013, 'sunday_holiday', '14:10:00', 'southbound'),
(60612, 13, 1013, 'sunday_holiday', '14:30:00', 'southbound'),
(60613, 13, 1013, 'sunday_holiday', '14:50:00', 'southbound');
-- 36 Broadway @ Ashland/63rd (1013) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60614, 13, 1013, 'saturday', '15:10:00', 'southbound'),
(60615, 13, 1013, 'saturday', '15:30:00', 'southbound');
-- 36 Broadway @ Jackson (1004) seq 4 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60616, 13, 1004, 'weekday', '12:05:00', 'southbound'),
(60617, 13, 1004, 'weekday', '12:13:00', 'southbound'),
(60618, 13, 1004, 'weekday', '12:21:00', 'southbound'),
(60619, 13, 1004, 'weekday', '12:29:00', 'southbound'),
(60620, 13, 1004, 'weekday', '12:37:00', 'southbound'),
(60621, 13, 1004, 'weekday', '12:45:00', 'southbound'),
(60622, 13, 1004, 'weekday', '12:53:00', 'southbound'),
(60623, 13, 1004, 'weekday', '13:01:00', 'southbound'),
(60624, 13, 1004, 'weekday', '13:09:00', 'southbound'),
(60625, 13, 1004, 'weekday', '13:17:00', 'southbound');
-- 36 Broadway @ Jackson (1004) seq 4 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60626, 13, 1004, 'sunday_holiday', '14:05:00', 'southbound'),
(60627, 13, 1004, 'sunday_holiday', '14:25:00', 'southbound'),
(60628, 13, 1004, 'sunday_holiday', '14:45:00', 'southbound');
-- 36 Broadway @ Jackson (1004) seq 4 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60629, 13, 1004, 'saturday', '15:05:00', 'southbound'),
(60630, 13, 1004, 'saturday', '15:25:00', 'southbound');
-- 36 Broadway @ Clark/Lake (1006) seq 5 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60631, 13, 1006, 'weekday', '12:00:00', 'southbound'),
(60632, 13, 1006, 'weekday', '12:08:00', 'southbound'),
(60633, 13, 1006, 'weekday', '12:16:00', 'southbound'),
(60634, 13, 1006, 'weekday', '12:24:00', 'southbound'),
(60635, 13, 1006, 'weekday', '12:32:00', 'southbound'),
(60636, 13, 1006, 'weekday', '12:40:00', 'southbound'),
(60637, 13, 1006, 'weekday', '12:48:00', 'southbound'),
(60638, 13, 1006, 'weekday', '12:56:00', 'southbound'),
(60639, 13, 1006, 'weekday', '13:04:00', 'southbound'),
(60640, 13, 1006, 'weekday', '13:12:00', 'southbound');
-- 36 Broadway @ Clark/Lake (1006) seq 5 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60641, 13, 1006, 'sunday_holiday', '14:00:00', 'southbound'),
(60642, 13, 1006, 'sunday_holiday', '14:20:00', 'southbound'),
(60643, 13, 1006, 'sunday_holiday', '14:40:00', 'southbound');
-- 36 Broadway @ Clark/Lake (1006) seq 5 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60644, 13, 1006, 'saturday', '15:00:00', 'southbound'),
(60645, 13, 1006, 'saturday', '15:20:00', 'southbound');

-- 66 Chicago (14) - southbound
-- 66 Chicago @ Michigan/Chicago (1014) seq 1 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60646, 14, 1014, 'weekday', '12:15:00', 'southbound'),
(60647, 14, 1014, 'weekday', '12:23:00', 'southbound'),
(60648, 14, 1014, 'weekday', '12:31:00', 'southbound'),
(60649, 14, 1014, 'weekday', '12:39:00', 'southbound'),
(60650, 14, 1014, 'weekday', '12:47:00', 'southbound'),
(60651, 14, 1014, 'weekday', '12:55:00', 'southbound'),
(60652, 14, 1014, 'weekday', '13:03:00', 'southbound'),
(60653, 14, 1014, 'weekday', '13:11:00', 'southbound'),
(60654, 14, 1014, 'weekday', '13:19:00', 'southbound'),
(60655, 14, 1014, 'weekday', '13:27:00', 'southbound');
-- 66 Chicago @ Michigan/Chicago (1014) seq 1 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60656, 14, 1014, 'sunday_holiday', '14:15:00', 'southbound'),
(60657, 14, 1014, 'sunday_holiday', '14:35:00', 'southbound'),
(60658, 14, 1014, 'sunday_holiday', '14:55:00', 'southbound');
-- 66 Chicago @ Michigan/Chicago (1014) seq 1 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60659, 14, 1014, 'saturday', '15:15:00', 'southbound'),
(60660, 14, 1014, 'saturday', '15:35:00', 'southbound');
-- 66 Chicago @ Navy Pier Terminal (1015) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60661, 14, 1015, 'weekday', '12:10:00', 'southbound'),
(60662, 14, 1015, 'weekday', '12:18:00', 'southbound'),
(60663, 14, 1015, 'weekday', '12:26:00', 'southbound'),
(60664, 14, 1015, 'weekday', '12:34:00', 'southbound'),
(60665, 14, 1015, 'weekday', '12:42:00', 'southbound'),
(60666, 14, 1015, 'weekday', '12:50:00', 'southbound'),
(60667, 14, 1015, 'weekday', '12:58:00', 'southbound'),
(60668, 14, 1015, 'weekday', '13:06:00', 'southbound'),
(60669, 14, 1015, 'weekday', '13:14:00', 'southbound'),
(60670, 14, 1015, 'weekday', '13:22:00', 'southbound');
-- 66 Chicago @ Navy Pier Terminal (1015) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60671, 14, 1015, 'sunday_holiday', '14:10:00', 'southbound'),
(60672, 14, 1015, 'sunday_holiday', '14:30:00', 'southbound'),
(60673, 14, 1015, 'sunday_holiday', '14:50:00', 'southbound');
-- 66 Chicago @ Navy Pier Terminal (1015) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60674, 14, 1015, 'saturday', '15:10:00', 'southbound'),
(60675, 14, 1015, 'saturday', '15:30:00', 'southbound');
-- 66 Chicago @ Huron (1016) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60676, 14, 1016, 'weekday', '12:05:00', 'southbound'),
(60677, 14, 1016, 'weekday', '12:13:00', 'southbound'),
(60678, 14, 1016, 'weekday', '12:21:00', 'southbound'),
(60679, 14, 1016, 'weekday', '12:29:00', 'southbound'),
(60680, 14, 1016, 'weekday', '12:37:00', 'southbound'),
(60681, 14, 1016, 'weekday', '12:45:00', 'southbound'),
(60682, 14, 1016, 'weekday', '12:53:00', 'southbound'),
(60683, 14, 1016, 'weekday', '13:01:00', 'southbound'),
(60684, 14, 1016, 'weekday', '13:09:00', 'southbound'),
(60685, 14, 1016, 'weekday', '13:17:00', 'southbound');
-- 66 Chicago @ Huron (1016) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60686, 14, 1016, 'sunday_holiday', '14:05:00', 'southbound'),
(60687, 14, 1016, 'sunday_holiday', '14:25:00', 'southbound'),
(60688, 14, 1016, 'sunday_holiday', '14:45:00', 'southbound');
-- 66 Chicago @ Huron (1016) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60689, 14, 1016, 'saturday', '15:05:00', 'southbound'),
(60690, 14, 1016, 'saturday', '15:25:00', 'southbound');
-- 66 Chicago @ Shore Drive (1017) seq 4 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60691, 14, 1017, 'weekday', '12:00:00', 'southbound'),
(60692, 14, 1017, 'weekday', '12:08:00', 'southbound'),
(60693, 14, 1017, 'weekday', '12:16:00', 'southbound'),
(60694, 14, 1017, 'weekday', '12:24:00', 'southbound'),
(60695, 14, 1017, 'weekday', '12:32:00', 'southbound'),
(60696, 14, 1017, 'weekday', '12:40:00', 'southbound'),
(60697, 14, 1017, 'weekday', '12:48:00', 'southbound'),
(60698, 14, 1017, 'weekday', '12:56:00', 'southbound'),
(60699, 14, 1017, 'weekday', '13:04:00', 'southbound'),
(60700, 14, 1017, 'weekday', '13:12:00', 'southbound');
-- 66 Chicago @ Shore Drive (1017) seq 4 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60701, 14, 1017, 'sunday_holiday', '14:00:00', 'southbound'),
(60702, 14, 1017, 'sunday_holiday', '14:20:00', 'southbound'),
(60703, 14, 1017, 'sunday_holiday', '14:40:00', 'southbound');
-- 66 Chicago @ Shore Drive (1017) seq 4 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60704, 14, 1017, 'saturday', '15:00:00', 'southbound'),
(60705, 14, 1017, 'saturday', '15:20:00', 'southbound');

-- 151 Sheridan (15) - southbound
-- 151 Sheridan @ Navy Pier Terminal (1015) seq 2 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60706, 15, 1015, 'weekday', '12:10:00', 'southbound'),
(60707, 15, 1015, 'weekday', '12:18:00', 'southbound'),
(60708, 15, 1015, 'weekday', '12:26:00', 'southbound'),
(60709, 15, 1015, 'weekday', '12:34:00', 'southbound'),
(60710, 15, 1015, 'weekday', '12:42:00', 'southbound'),
(60711, 15, 1015, 'weekday', '12:50:00', 'southbound'),
(60712, 15, 1015, 'weekday', '12:58:00', 'southbound'),
(60713, 15, 1015, 'weekday', '13:06:00', 'southbound'),
(60714, 15, 1015, 'weekday', '13:14:00', 'southbound'),
(60715, 15, 1015, 'weekday', '13:22:00', 'southbound');
-- 151 Sheridan @ Navy Pier Terminal (1015) seq 2 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60716, 15, 1015, 'sunday_holiday', '14:10:00', 'southbound'),
(60717, 15, 1015, 'sunday_holiday', '14:30:00', 'southbound'),
(60718, 15, 1015, 'sunday_holiday', '14:50:00', 'southbound');
-- 151 Sheridan @ Navy Pier Terminal (1015) seq 2 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60719, 15, 1015, 'saturday', '15:10:00', 'southbound'),
(60720, 15, 1015, 'saturday', '15:30:00', 'southbound');
-- 151 Sheridan @ Huron (1016) seq 3 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60721, 15, 1016, 'weekday', '12:05:00', 'southbound'),
(60722, 15, 1016, 'weekday', '12:13:00', 'southbound'),
(60723, 15, 1016, 'weekday', '12:21:00', 'southbound'),
(60724, 15, 1016, 'weekday', '12:29:00', 'southbound'),
(60725, 15, 1016, 'weekday', '12:37:00', 'southbound'),
(60726, 15, 1016, 'weekday', '12:45:00', 'southbound'),
(60727, 15, 1016, 'weekday', '12:53:00', 'southbound'),
(60728, 15, 1016, 'weekday', '13:01:00', 'southbound'),
(60729, 15, 1016, 'weekday', '13:09:00', 'southbound'),
(60730, 15, 1016, 'weekday', '13:17:00', 'southbound');
-- 151 Sheridan @ Huron (1016) seq 3 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60731, 15, 1016, 'sunday_holiday', '14:05:00', 'southbound'),
(60732, 15, 1016, 'sunday_holiday', '14:25:00', 'southbound'),
(60733, 15, 1016, 'sunday_holiday', '14:45:00', 'southbound');
-- 151 Sheridan @ Huron (1016) seq 3 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60734, 15, 1016, 'saturday', '15:05:00', 'southbound'),
(60735, 15, 1016, 'saturday', '15:25:00', 'southbound');
-- 151 Sheridan @ Shore Drive (1017) seq 4 - weekday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60736, 15, 1017, 'weekday', '12:00:00', 'southbound'),
(60737, 15, 1017, 'weekday', '12:08:00', 'southbound'),
(60738, 15, 1017, 'weekday', '12:16:00', 'southbound'),
(60739, 15, 1017, 'weekday', '12:24:00', 'southbound'),
(60740, 15, 1017, 'weekday', '12:32:00', 'southbound'),
(60741, 15, 1017, 'weekday', '12:40:00', 'southbound'),
(60742, 15, 1017, 'weekday', '12:48:00', 'southbound'),
(60743, 15, 1017, 'weekday', '12:56:00', 'southbound'),
(60744, 15, 1017, 'weekday', '13:04:00', 'southbound'),
(60745, 15, 1017, 'weekday', '13:12:00', 'southbound');
-- 151 Sheridan @ Shore Drive (1017) seq 4 - sunday_holiday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60746, 15, 1017, 'sunday_holiday', '14:00:00', 'southbound'),
(60747, 15, 1017, 'sunday_holiday', '14:20:00', 'southbound'),
(60748, 15, 1017, 'sunday_holiday', '14:40:00', 'southbound');
-- 151 Sheridan @ Shore Drive (1017) seq 4 - saturday southbound
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(60749, 15, 1017, 'saturday', '15:00:00', 'southbound'),
(60750, 15, 1017, 'saturday', '15:20:00', 'southbound');
