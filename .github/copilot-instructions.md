# Copilot instructions for this repository ✅

## Quick context (what this project is) 💡
- Small MySQL-based transit schema modeled after CTA: database name is `chicago_cta`. See `deliverable 2/ddl-create-db-and-tables.sql` for full DDL.
- Relational design includes: `Line`, `Station`, `StationLine` (join), `TimeTable`, `Fare`, `Alert`, `AlertLine`, `AlertStation`.
- Data and setup scripts live under `deliverable 2/` (DDL, inserts, indexes, views).

## Important technical details (be precise) 🔧
- SQL dialect: **MySQL / InnoDB** (DDL uses `ENGINE=InnoDB`, `ENUM`, `BOOLEAN`).
- IDs are explicit integers (no `AUTO_INCREMENT` in DDL) — callers must supply primary key values when inserting rows.
- Foreign keys use `ON DELETE CASCADE` or `ON DELETE RESTRICT` based on relationship intent. Respect these when deleting/updating.
- Time and date types: `TIME` (`timeOfDay`) and `DATETIME` (`startTime`, `endTime`). Views use `NOW()`; watch timezone implications when testing.

## Naming & pattern conventions to follow 🧭
- Files and primary scripts of interest:
  - `deliverable 2/ddl-create-db-and-tables.sql` (schema)
  - `deliverable 2/insert-general-data.sql` (seed data, uses `START TRANSACTION`/`COMMIT`)
  - `deliverable 2/create-indexes.sql` (index naming `idx_...` and composite indexes)
  - `deliverable 2/create-views.sql` (views use `v_` prefix: `v_line_schedule`, `v_active_alerts`, `v_alerts_by_line`, `v_line_stops`)
- Index naming: `idx_<table>_<purpose>`; expect composite index ordering to reflect common WHERE filters (e.g., `lineID, stationID, dayType, direction, timeOfDay`).
- Join tables use compound primary keys (e.g., `StationLine` PK is `(stationID,lineID)`); ordering matters when reasoning about uniqueness and insert patterns.

## Typical developer flow / CLI commands (examples) ▶️
- Create DB + tables:

  mysql -u root -p < "deliverable 2/ddl-create-db-and-tables.sql"

- Load seed data (after DDL):

  mysql -u root -p chicago_cta < "deliverable 2/insert-general-data.sql"

- Create indexes and views:

  mysql -u root -p chicago_cta < "deliverable 2/create-indexes.sql"
  mysql -u root -p chicago_cta < "deliverable 2/create-views.sql"

- Quick verification queries:

  SELECT COUNT(*) FROM Line; -- expect >= 15
  SELECT * FROM v_active_alerts; -- current alerts (uses NOW())
  SELECT timeOfDay FROM TimeTable WHERE lineID=1 AND stationID=1001 AND dayType='weekday' ORDER BY timeOfDay;

## Things to watch / gotchas ⚠️
- Primary keys are not auto-generated — tests/tools that insert rows need to assign non-colliding IDs.
- `StationLine` PK `(stationID,lineID)` means `stopSequence` is not part of the PK; queries that rely on stop ordering should use `idx_stationline_line_sequence` and ORDER BY `stopSequence`.
- Enum values are fixed in DDL (e.g., `dayType` has `weekday, saturday, sunday_holiday`; `severity` has `info, minor, major, critical`). Use exact values when filtering.
- Sample alert timestamps are Jan–Feb 2026 (seed data). `v_active_alerts` uses `NOW()` so test results depend on current datetime.

## Examples to copy or reuse in PRs ✍️
- Use the `v_*` views for common joins rather than rewriting joins directly; e.g., prefer `SELECT * FROM v_line_schedule WHERE lineID=1 ORDER BY timeOfDay` for schedule lookups.
- Use composite index ordering from `create-indexes.sql` when writing queries to ensure index usage.

## When to ask for clarification / missing information ❓
- If a change requires adding `AUTO_INCREMENT` behavior or modifying PKs, confirm intended insertion patterns and data lifecycle.
- If tests or CI should be added, confirm preferred test harness (no tests currently present).

---
If any point above is unclear or you want me to add CI/test setup notes or example SQL-based unit checks, tell me which part to expand and I’ll update this file. ✅