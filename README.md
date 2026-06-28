# faishal-skills

[![skills.sh](https://skills.sh/b/faishalrachman/my-skills)](https://skills.sh/faishalrachman/my-skills)

Faishal's agent skills for Claude Code — for shipping small, sellable products without over-building.

These skills lean two directions: **build less** (write the minimum code that works, say it in fewer tokens) and **sell first** (find a paid-for problem, pressure-test the idea, scope the smallest version someone will pay for). They're compact, model-agnostic, and meant to be forked and tuned.

## Quickstart

**Via [skills.sh](https://skills.sh) (per-project):**

```bash
npx skills@latest add faishalrachman/my-skills
```

Select the skills and coding agents you want, and you're ready.

**Via Claude Code marketplace:**

```
/plugin marketplace add faishalrachman/my-skills
/plugin install faishal-skills
```

## Reference

### Engineering

Skills for code work.

- **[yagni](./skills/yagni/SKILL.md)** — Laziest-solution-that-works mode in caveman speak. Build the minimum code that solves the real problem, and say it in ~75% fewer tokens with full technical accuracy. Triggers on `/yagni`, "be lazy", "simplest solution", or complaints about over-engineering.
- **[data-analytics](./skills/data-analytics/SKILL.md)** — Generic SQL analytics over any data source: remote DB via MCP, or CSV/Excel/Parquet/SQLite/local Postgres/MySQL via DuckDB. Caches a relation/field map to `data/db-relations.md` on first use, then pulls data or hunts anomalies by business logic and writes every result to `data/<slug>.md` + `.xlsx`.

### Product

Skills for finding, validating, and scoping what to build.

- **[find-problem](./skills/product/find-problem/SKILL.md)** — Surprise you with 5–7 monetizable B2B problem wedges to build a small profitable product around. Biased to boring, painful, already-paid-for problems. Search-backed.
- **[product-research](./skills/product/product-research/SKILL.md)** — Research a problem into a monetizable wedge a solo technical founder can sell. Segments the pain, finds demand signals and existing pricing, ranks angles, then hands the top wedge to grilling.
- **[mvp](./skills/product/mvp/SKILL.md)** — Write a lean PRD for the smallest *sellable* version — shippable in ~2 weeks, ruthlessly cut. Anything not required to charge money is out of scope for v1.
- **[grill-business](./skills/product/grill-business/SKILL.md)** — Adversarial angel-investor pressure-test of an idea. Hunts the weakest link fastest — paying buyer, willingness to pay, distribution — and forces evidence, not vibes.
- **[grill-me](./skills/product/grill-me/SKILL.md)** — Relentless one-at-a-time interview that walks a plan or design down its decision tree, recommending an answer at each branch.
- **[grill-with-docs](./skills/product/grill-with-docs/SKILL.md)** — Grill a plan against your BRD/PRD/TRD + glossary, sharpening terminology and updating those docs inline as decisions crystallise.

## Add a skill

1. `mkdir skills/<name>`
2. Write `skills/<name>/SKILL.md` with frontmatter (`name`, `description` — the description holds the trigger words).
3. Add `"./skills/<name>"` to the `skills` array in [`.claude-plugin/plugin.json`](./.claude-plugin/plugin.json).

## License

[MIT](./LICENSE)
