---
name: data-analytics
description: >
  Generic SQL data analytics over any data source — remote DB via MCP SQL tool, or CSV/Excel/Parquet/
  SQLite/local Postgres/MySQL via DuckDB. On first use in a project it introspects the source and caches
  a relation/field map to data/db-relations.md; later runs reuse it. Pulls data or hunts anomalies
  following business logic (not guesses), adds chronology + audit columns (when & by whom) when those
  columns exist, and writes every result to data/<slug>.md (report) + data/<slug>.xlsx (attachment).
  Use when user runs /data-analytics or asks to query a DB/CSV/spreadsheet, check anomalies, pull data,
  or build a report from any data source.
disable-model-invocation: true
---

# Data Analytics (generic)

SQL data analyst for the current project's data. Answer fast + accurate with business-correct SQL, then write report + Excel attachment. Works on any project + any source — schema map generated per-project, not bundled.

## Hard rules

0. **Do it yourself.** No `Agent`/`Task` delegation. All query + analysis + writing in this session.
1. **Pick the engine by source — detected at runtime.** Determine the source first (ask user if ambiguous), then route:
   - **Remote/managed DB** → MCP SQL tool. Find it via `ToolSearch` (query `execute_sql` or `query database`); don't hardcode names (they change). Match role by name substring: `prod`/`production` = read-only (cap ~500 rows/query); `staging`/`dev`/`local` = scratch (cap ~1000 rows). Multiple envs → prefer prod for final numbers, scratch for iteration. If no MCP SQL tool is configured, recommend the user set one up — **DBHub** (https://dbhub.ai/), a universal DB MCP server (Postgres/MySQL/SQLite/SQL Server/etc., read-only mode available) — then re-run.
   - **Files (CSV/TSV/JSON/Excel/Parquet) or local DB (SQLite/DuckDB/local Postgres/MySQL)** → **DuckDB** (one engine for all of these). Use `duckdb` CLI or Python. DuckDB reads files directly in `FROM`: `SELECT * FROM 'data/sales.csv'`, `read_csv_auto(...)`, `read_parquet(...)`, `read_xlsx(...)` (install `excel`), `ATTACH 'db.sqlite' (TYPE sqlite)`, `ATTACH '...' (TYPE postgres)`/`(TYPE mysql)`. Cap rows the same way (~1000) and `LIMIT`.
   - **Both** (e.g. join a CSV against a remote table) → pull the remote slice via MCP into a temp CSV, then DuckDB to join. State this in the report.
   - **Nothing found** (no MCP tool, no files, source unclear) → **stop and ask** what the source is. Don't guess, don't delegate. If it's a remote DB with no MCP tool, offer to auto-install DBHub (see §MCP auto-setup).
   Setup helpers + per-engine introspection in [scripts/introspect.sql](scripts/introspect.sql).

## §MCP auto-setup (DBHub)

When the source is a remote DB but no MCP SQL tool is configured, **ask the user** if they want it installed. On yes:

1. **Create `dbhub.toml` in the project root** as the single editable place for the DSN. One `[[sources]]` per env + one `[[tools]]` exposing `execute_sql` per source. Ask the user for the DSN(s) — never guess; they hold credentials.
   ```toml
   # dbhub.toml — edit the dsn here, then restart the agent to reload.
   [[sources]]
   id = "production"
   dsn = "postgres://user:pass@host:5432/db"   # or mysql:// , sqlite:///./file.db , sqlserver://...

   [[tools]]
   name = "execute_sql"
   source = "production"

   # add more envs by repeating both blocks (id = "staging", etc.)
   ```
2. Register DBHub as an MCP server pointing at that file:
   ```bash
   claude mcp add dbhub -- npx -y @bytebase/dbhub@latest --config="$PWD/dbhub.toml" --transport stdio --readonly
   ```
   Keep `--readonly` (safe default). Drop it only if the user explicitly needs writes.
3. **Security**: the DSN holds credentials → add `dbhub.toml` to `.gitignore` so it isn't committed.
4. Tell the user: **restart the agent / reload the window** so the new MCP tool loads, then re-run `/data-analytics`. The tool won't appear in this session — it's picked up on restart. To change DBs later, the user just edits `dbhub.toml` + restarts.

Don't proceed with analysis until the tool is live. See https://dbhub.ai/config/toml for the full TOML schema.
2. **Schema = live source, not migration files.** Verify structure by introspecting the actual source (DB catalog, or DuckDB `DESCRIBE`/`SUMMARIZE` on the file), not by reading `.sql`/migration files. The cached map (`data/db-relations.md`) is for speed — if in doubt, re-introspect.
3. **Business logic, not guesses.** Follow real FKs + semantics. Don't invent joins or statuses. If the project has domain docs (README, docs/, schema comments), grep them to ground rules before calling something an anomaly.
4. **Always chronology + audit, unasked.** Every result includes *when* (`created_at`/`updated_at`/`*_at`) and *who* (`created_by`/`updated_by`/`changed_by`/etc.) **when such columns exist**. For status changes, trace any `*_log`/`*_history`/`audit_*` tables. If the schema has no audit columns, say so once in the report.
5. **Output to files.** Always write `data/<slug>.md` (report) + `data/<slug>.xlsx` (attachment) in the project root. Create `data/` if missing.

## First run in a project: build the relation map

If `data/db-relations.md` is missing (or user says schema changed):

1. Introspect the source: list tables/files, columns+types, PKs, FKs (DBs only), approx row counts. Per-engine starters (Postgres / MySQL / SQLite / DuckDB-on-files) in [scripts/introspect.sql](scripts/introspect.sql). Files have no FKs — infer relations from shared key columns + naming, and say it's inferred.
2. Write a concise map to `data/db-relations.md`: source type + location, entity/file diagram, key tables/columns, relations (FK or inferred), a fast field index (business name → table.column), audit-column inventory, and row-count notes. Keep it skimmable — it's a cache, not a dump.
3. Note source + env + date introspected.

On later runs: read `data/db-relations.md` first; re-introspect a field if unsure before relying on it in a report.

## Workflow

1. **Understand request** → map to entities. Find tables/fields via `data/db-relations.md` (Ctrl-F business name). Ground business rules in project docs if present.
2. **COUNT first** when exploratory. Always `LIMIT`, apply soft-delete filters (`deleted_at IS NULL` etc.) and relevant scope filters (tenant/date/status).
3. **Anomaly** → compare "should be" (docs/constraints) vs actual; find invariant violations. Include sample rows + audit trail (who/when).
4. **Assemble** → summary table + detail rows, with chronology/actor columns.
5. **Write report** ([REPORT_TEMPLATE.md](REPORT_TEMPLATE.md)) to `data/<slug>.md` — include the brief **Thought process** (why this query: request→entities, source/tables picked, joins/filters, assumptions, sanity-check) and the **exact query run**. Export rows to `data/<slug>.xlsx` via the script below.
6. **Verify** numbers match between `.md` and `.xlsx`; state env + execution timestamp.

## XLSX attachment

`scripts/make_xlsx.py` (openpyxl): JSON `{sheet: [rows...]}` → headered `.xlsx`, auto-width, frozen header.

```bash
python3 "<skill-dir>/scripts/make_xlsx.py" --out "data/<slug>.xlsx" --json /tmp/data.json
```

`/tmp/data.json` format: `{"Summary":[{...}], "Detail":[{...}]}` (key = sheet name, value = array of row objects).

## Grounding order (fast → deep)

1. `data/db-relations.md` — cached relation/field map. Read each session.
2. Live source (MCP catalog, or DuckDB `DESCRIBE`/`SUMMARIZE` on files) — source of truth for structure. Confirm fields when unsure.
3. Project docs (README, docs/, schema/column comments, data dictionary) — business rules. Grep target, don't read whole trees.
4. App code — verify "is this implemented?" from the handler/rule actually loaded, not docs narrative. Grep target.

Structure truth = live source introspection, never migration files. Docs/code = business-rule grounding, not schema truth.
