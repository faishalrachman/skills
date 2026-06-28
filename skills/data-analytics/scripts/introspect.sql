-- Schema introspection starters, per engine. Run via MCP SQL tool (remote DB)
-- or DuckDB CLI/Python (files + local DBs) to build data/db-relations.md.

-- =====================================================================
-- DUCKDB — any file (CSV/TSV/JSON/Excel/Parquet) or attached local DB.
-- One engine for all local sources. Install once: pip install duckdb
-- =====================================================================
-- Read files directly, no import step:
--   SELECT * FROM 'data/sales.csv' LIMIT 10;          -- auto-detect
--   SELECT * FROM read_csv_auto('data/sales.csv');
--   SELECT * FROM read_parquet('data/*.parquet');
--   INSTALL excel; LOAD excel; SELECT * FROM read_xlsx('data/book.xlsx');
-- Attach a real DB and introspect it with the same SQL:
--   ATTACH 'app.sqlite'  AS s (TYPE sqlite);
--   ATTACH 'host=... dbname=...' AS pg (TYPE postgres);
--   ATTACH 'host=... database=...' AS my (TYPE mysql);
-- Structure of a file or table:
DESCRIBE SELECT * FROM 'data/sales.csv';       -- column names + types
SUMMARIZE SELECT * FROM 'data/sales.csv';      -- types, null %, min/max, approx distinct
-- Catalog of attached/loaded objects:
SELECT table_catalog, table_schema, table_name, column_name, data_type, is_nullable
FROM information_schema.columns ORDER BY 1,2,3,ordinal_position;
SELECT * FROM duckdb_tables();                 -- tables + estimated_size (rows)
-- Files have no FK metadata: infer relations from shared key-named columns
-- (e.g. *_id matching another file's id) and label them "inferred" in the map.

-- =====================================================================
-- POSTGRESQL  (via MCP or DuckDB postgres ATTACH)
-- =====================================================================
-- Tables + approx rows
SELECT n.nspname AS schema, c.relname AS table, c.reltuples::bigint AS approx_rows
FROM pg_class c JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE c.relkind = 'r' AND n.nspname NOT IN ('pg_catalog','information_schema')
ORDER BY approx_rows DESC;
-- Columns
SELECT table_schema, table_name, column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema NOT IN ('pg_catalog','information_schema')
ORDER BY table_schema, table_name, ordinal_position;
-- Primary keys
SELECT tc.table_schema, tc.table_name, kcu.column_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
  ON tc.constraint_name = kcu.constraint_name AND tc.table_schema = kcu.table_schema
WHERE tc.constraint_type = 'PRIMARY KEY'
ORDER BY tc.table_schema, tc.table_name;
-- Foreign keys (relation graph)
SELECT tc.table_schema, tc.table_name, kcu.column_name,
       ccu.table_schema AS ref_schema, ccu.table_name AS ref_table, ccu.column_name AS ref_column
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
  ON tc.constraint_name = kcu.constraint_name AND tc.table_schema = kcu.table_schema
JOIN information_schema.constraint_column_usage ccu
  ON ccu.constraint_name = tc.constraint_name AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY'
ORDER BY tc.table_schema, tc.table_name;

-- =====================================================================
-- MYSQL / MariaDB
-- =====================================================================
-- Tables + approx rows
SELECT table_schema, table_name, table_rows AS approx_rows
FROM information_schema.tables
WHERE table_schema NOT IN ('mysql','information_schema','performance_schema','sys')
ORDER BY table_rows DESC;
-- Columns
SELECT table_schema, table_name, column_name, column_type, is_nullable, column_key, column_default
FROM information_schema.columns
WHERE table_schema NOT IN ('mysql','information_schema','performance_schema','sys')
ORDER BY table_schema, table_name, ordinal_position;
-- Foreign keys
SELECT table_schema, table_name, column_name,
       referenced_table_schema AS ref_schema, referenced_table_name AS ref_table,
       referenced_column_name AS ref_column
FROM information_schema.key_column_usage
WHERE referenced_table_name IS NOT NULL
ORDER BY table_schema, table_name;

-- =====================================================================
-- SQLITE  (native; or use DuckDB sqlite ATTACH above)
-- =====================================================================
SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;
-- Per table (loop over names):
--   PRAGMA table_info('<table>');         -- columns, types, pk flag
--   PRAGMA foreign_key_list('<table>');   -- FK targets
--   SELECT count(*) FROM "<table>";       -- exact rows

-- =====================================================================
-- AUDIT-COLUMN INVENTORY (Postgres/MySQL info_schema; adapt regex per engine)
-- =====================================================================
SELECT table_schema, table_name,
       string_agg(column_name, ', ' ORDER BY column_name) AS audit_cols
FROM information_schema.columns
WHERE column_name ~* '(created|updated|deleted|changed)_(at|by)$'
   OR column_name ~* '_(at|by)$'
   OR column_name IN ('actor','timestamp')
GROUP BY table_schema, table_name
ORDER BY table_schema, table_name;
-- MySQL has no regex in info_schema filter easily — use: column_name LIKE '%\_at' ESCAPE '\'
--   OR column_name LIKE '%\_by' ESCAPE '\'. DuckDB: use list_filter on column_name or regexp_matches.
