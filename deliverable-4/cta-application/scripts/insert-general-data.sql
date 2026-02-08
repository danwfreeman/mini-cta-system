USE chicago_cta;
START TRANSACTION;



-- Mix of CTA 'L' lines + a few well-known bus routes
INSERT INTO Line (lineID, name, mode) VALUES
(1,  'Red Line',    'train'),
(2,  'Blue Line',   'train'),
(3,  'Brown Line',  'train'),
(4,  'Green Line',  'train'),
(5,  'Orange Line', 'train'),
(6,  'Purple Line', 'train'),
(7,  'Pink Line',   'train'),
(8,  'Yellow Line', 'train'),
(9,  '8 Halsted',   'bus'),
(10, '9 Ashland',   'bus'),
(11, '20 Madison',  'bus'),
(12, '22 Clark',    'bus'),
(13, '36 Broadway', 'bus'),
(14, '66 Chicago',  'bus'),
(15, '151 Sheridan','bus');

-- Rail station names based on CTA 'L' system map (plus a few bus stops)
INSERT INTO Station (stationID, name, mode, isAccessible) VALUES
(1001, 'Howard',            'train', FALSE),
(1002, 'Belmont',           'train', TRUE),
(1003, 'Fullerton',         'train', FALSE),
(1004, 'Jackson',           'train', TRUE),
(1005, 'Roosevelt',         'train', TRUE),
(1006, 'Clark/Lake',        'train', FALSE),
(1007, 'O''Hare',           'train', TRUE),
(1008, '95th/Dan Ryan',     'train', TRUE),
(1009, 'Cermak-Chinatown',  'train', TRUE),
(1010, 'Sox-35th',          'train', TRUE),
(1011, 'Halsted/79th',      'bus',   FALSE),
(1012, 'Broadway/Waveland', 'bus',   FALSE),
(1013, 'Ashland/63rd',      'bus',   TRUE),
(1014, 'Michigan/Chicago',  'bus',   FALSE),
(1015, 'Navy Pier Terminal','bus',   TRUE);

INSERT INTO Station (stationID, name, mode, isAccessible) VALUES
(1016, 'Huron','bus',   TRUE),
(1017, 'Shore Drive','bus',   TRUE);

-- Connect stations to lines with a simple stopSequence.
INSERT INTO StationLine (stationID, lineID, stopSequence) VALUES
-- Red Line (train)
(1001, 1,  1),  -- Howard
(1002, 1,  2),  -- Belmont
(1003, 1,  3),  -- Fullerton
(1004, 1,  4),  -- Jackson
(1008, 1,  5),  -- 95th/Dan Ryan

-- Blue Line (train)
(1007, 2,  1),  -- O'Hare
(1006, 2,  2),  -- Clark/Lake
(1004, 2,  3),  -- Jackson

-- Bus 8 Halsted
(1011, 9,  1),  -- Halsted/79th
(1012, 9,  2),  -- Broadway/Waveland (route info page terminals)
(1013, 9,  3),  -- (representing a mid-route major intersection)

-- Bus 9 Ashland
(1013, 10, 1),  -- Ashland/63rd
(1005, 10, 2),  -- Roosevelt (common transfer area as a “stop” conceptually)
(1014, 10, 3),  -- Michigan/Chicago (downtown-ish)

-- Bus 20 Madison
(1011, 11, 1),  -- Halsted/79th
(1012, 11, 2),  -- Broadway/Waveland (route info page terminals)
(1013, 11, 3),  -- (representing a mid-route major intersection)

-- Bus 22 Clark
(1011, 12, 1),  -- Halsted/79th
(1015, 12, 2),  -- Broadway/Waveland (route info page terminals)
(1013, 12, 3),  -- (representing a mid-route major intersection)


-- Bus 36 Broadway
(1011, 13, 1),  -- Halsted/79th
(1012, 13, 2),  -- Broadway/Waveland (route info page terminals)
(1013, 13, 3),  -- (representing a mid-route major intersection)
(1004, 13, 4),  -- L stop, Red
(1006, 13, 5),  -- L stop, Blue


-- Bus 151 Sheridan
(1014, 15, 1),  -- Michigan/Chicago
(1015, 15, 2),  -- Navy Pier Terminal
(1016, 15, 3),  -- Huron
(1017, 15, 4);  -- Shore Drive

INSERT INTO StationLine (stationID, lineID, stopSequence) VALUES
-- Brown Line (train)
(1002, 3,  1),  -- Belmont
(1003, 3,  2),  -- Fullerton
(1006, 3,  3),  -- Clark/Lake

-- Green Line (train)
(1001, 4,  1),  -- Howard
(1006, 4,  2),  -- Clark/Lake
(1005, 4,  3),  -- Roosevelt

-- Orange Line (train)
(1005, 5,  1),  -- Roosevelt
(1009, 5,  2),  -- Cermak-Chinatown
(1010, 5,  3),  -- Sox-35th

-- Purple Line (train)
(1001, 6,  1),  -- Howard
(1002, 6,  2),  -- Belmont
(1003, 6,  3),  -- Fullerton

-- Pink Line (train)
(1003, 7,  1),  -- Fullerton
(1006, 7,  2),  -- Clark/Lake
(1005, 7,  3),  -- Roosevelt

-- Yellow Line (train)
(1001, 8,  1),  -- Howard
(1006, 8,  2),  -- Clark/Lake
(1004, 8,  3);  -- Jackson



-- bus 66 Chicago
INSERT INTO StationLine (stationID, lineID, stopSequence) VALUES
(1014, 14, 1),  -- Michigan/Chicago
(1015, 14, 2),  -- Navy Pier Terminal
(1016, 14, 3),  -- Huron
(1017, 14, 4);  -- Shore Drive


-- A few sample times across lines, stations, day types, directions
INSERT INTO TimeTable (timetableID, lineID, stationID, dayType, timeOfDay, direction) VALUES
(2001, 1, 1001, 'weekday',        '06:05:00', 'southbound'),
(2002, 1, 1002, 'weekday',        '06:18:00', 'southbound'),
(2003, 1, 1004, 'weekday',        '06:40:00', 'southbound'),
(2004, 1, 1008, 'weekday',        '07:20:00', 'southbound'),
(2005, 1, 1008, 'weekday',        '17:10:00', 'northbound'),

(2006, 2, 1007, 'weekday',        '06:12:00', 'eastbound'),
(2007, 2, 1006, 'weekday',        '06:52:00', 'eastbound'),
(2008, 2, 1004, 'weekday',        '07:05:00', 'eastbound'),
(2009, 2, 1004, 'saturday',       '10:15:00', 'westbound'),
(2010, 2, 1007, 'sunday_holiday', '22:40:00', 'westbound'),

(2011, 9, 1011, 'weekday',        '05:10:00', 'northbound'),
(2012, 9, 1012, 'weekday',        '05:55:00', 'southbound'),
(2013, 10,1013, 'weekday',        '07:30:00', 'northbound'),
(2014, 15,1014, 'saturday',       '12:20:00', 'northbound'),
(2015, 14,1015, 'sunday_holiday', '14:05:00', 'eastbound');

-- Amounts based on CTA fare chart:
-- Rail $2.50 full / $1.25 reduced / $0.75 student
-- Bus  $2.25 full / $1.10 reduced / $0.75 student
-- Cash bus full $2.50 / reduced $1.25 / student $0.75
-- O'Hare entry full $5.00 / reduced $1.25 / student $0.75
-- Passes: 1-day $5, 3-day $15, 7-day $20, 30-day $75 (full), $35 (reduced)
INSERT INTO Fare (fareID, fareCategory, riderCategory, price) VALUES
(3001, 'rail_ventra',        'regular', 2.50),
(3002, 'rail_ventra',        'reduced',  1.25),
(3003, 'rail_ventra',        'student',  0.75),

(3004, 'bus_ventra',         'regular', 2.25),
(3005, 'bus_ventra',         'reduced',  1.10),
(3006, 'bus_ventra',         'student',  0.75),

(3007, 'bus_cash',           'regular', 2.50),
(3008, 'bus_cash',           'reduced',  1.25),
(3009, 'bus_cash',           'student',  0.75),

(3010, 'ohare_entry',        'regular', 5.00),
(3011, 'ohare_entry',        'reduced',  1.25),
(3012, 'ohare_entry',        'student',  0.75),

(3013, 'pass_1_day',         'regular', 5.00),
(3014, 'pass_7_day',         'regular', 20.00),
(3015, 'pass_30_day',        'regular', 75.00),

(3016, 'pass_1_day',         'reduced', 4.50),
(3017, 'pass_1_day',         'student', 4.00),
(3018, 'pass_30_day',        'reduced', 65.00),
(3019, 'pass_30_day',        'student', 55.00),
(3020, 'pass_7_day',         'reduced', 18.00),
(3021, 'pass_7_day',         'student', 15.00);



-- Mock service + elevator-style alerts, with Jan 2026 timestamps
INSERT INTO Alert (alertID, title, description, startTime, endTime, severity) VALUES
(4001, 'Residual delays', 'Residual delays due to earlier signal issue. Allow extra travel time.', '2026-01-22 06:10:00', '2026-01-22 08:00:00', 'minor'),
(4002, 'Service disruption near O''Hare', 'Trains operating with delays near O''Hare. Consider alternate service.', '2026-01-23 15:20:00', '2026-01-23 17:10:00', 'major'),
(4003, 'Reroute in Loop', 'Trains rerouted around the Loop due to track work. Check platform signage.', '2026-01-24 09:00:00', '2026-01-24 15:00:00', 'info'),
(4004, 'Single tracking', 'Single tracking between stations due to maintenance. Expect delays.', '2026-01-21 10:30:00', '2026-01-21 13:30:00', 'minor'),
(4005, 'Late-night construction', 'Late-night service impacts due to planned construction.', '2026-01-24 22:00:00', '2026-01-25 04:00:00', 'info'),

(4006, 'Elevator outage', 'Elevator temporarily out of service. Use alternate accessible station if needed.', '2026-01-20 07:00:00', '2026-01-20 18:00:00', 'minor'),
(4007, 'Escalator maintenance', 'Escalator maintenance underway. Use stairs or alternate route.', '2026-01-19 08:00:00', '2026-01-19 16:00:00', 'info'),
(4008, 'Platform crowding', 'Platform crowding expected due to special event. Allow extra time.', '2026-01-23 18:00:00', '2026-01-23 21:30:00', 'major'),
(4009, 'Station work', 'Station improvements in progress. Some entrances may be closed.', '2026-01-18 05:00:00', '2026-02-02 23:59:00', 'info'),
(4010, 'Track inspection', 'Track inspection in progress; trains may operate at reduced speeds.', '2026-01-22 11:00:00', '2026-01-22 14:30:00', 'minor'),

(4011, 'Street Detour', 'Route detoured due to street closure. Temporary stops posted along detour.', '2026-01-23 06:00:00', '2026-01-23 12:00:00', 'info'),
(4012, 'Busdelays', 'Buses experiencing delays due to traffic congestion.', '2026-01-24 07:30:00', '2026-01-24 10:30:00', 'minor'),
(4013, 'Stop skipped', 'One stop temporarily skipped due to construction; use nearby stop.', '2026-01-21 09:00:00', '2026-01-21 17:00:00', 'info'),
(4014, 'Heavy ridership', 'Heavy ridership expected; extra buses may be added as needed.', '2026-01-24 12:00:00', '2026-01-24 18:00:00', 'minor'),
(4015, 'Weather-related delays', 'Weather conditions may cause delays. Use trackers for arrivals.', '2026-01-22 15:00:00', '2026-01-22 20:00:00', 'major');


-- One line association per alert 
INSERT INTO AlertLine (alertID, lineID) VALUES
(4001, 1),
(4002, 2),
(4010, 1),
(4011, 9),
(4015, 14);

-- One station association per alert 
INSERT INTO AlertStation (alertID, stationID) VALUES
(4007, 1004), -- Jackson
(4008, 1005), -- Roosevelt
(4009, 1008), -- 95th/Dan Ryan
(4015, 1015); -- Navy Pier Terminal

COMMIT;
