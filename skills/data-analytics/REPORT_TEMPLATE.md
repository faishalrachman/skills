# Report: <title>

- **Slug**: `<slug>` · **Attachment**: [`<slug>.xlsx`](./<slug>.xlsx)
- **Environment**: production | staging | both · **Data as of**: <source data date>
- **Executed**: <YYYY-MM-DD HH:MM TZ> · **Request**: <one sentence>

## Summary
<2–4 sentences: main finding + key numbers. If anomaly: rows affected, impact.>

## Thought process (brief)
<3–6 bullets, the reasoning trail: how the request maps to entities → which source/tables chosen + why → key joins/filters → assumptions made → how the result was sanity-checked. Keep it short — it's the "why this query", not a tutorial.>
- ...

## Findings
| Metric | Value | Note |
|--------|-------|------|
| ... | ... | ... |

## Detail & evidence
<sample rows. Include chronology + actor columns when those columns exist: created_at/updated_at, created_by/updated_by, or from *_log/audit tables. If schema has no audit columns, say so here.>

| id | ... | when | actor | audit source |
|----|-----|------|-------|--------------|

## Method
- **Business rule / logic**: <doc/constraint reference + invariant used>
- **Relations/fields**: <table.column & joins>
- **Query**:
```sql
-- exact query run
```

## Limitations / notes
<staging lag, soft-delete, sampling/LIMIT, env diff if prod≠staging, etc.>
