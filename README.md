# faishal-skills

Faishal's agent skills for Claude Code.

## Install

**Via npx skills (per-project):**

```bash
npx skills@latest add faishalrachman/my-skills
```

**Via Claude Code marketplace:**

```
/plugin marketplace add faishalrachman/my-skills
/plugin install faishal-skills
```

## Skills

| Skill | What |
|-------|------|
| `/yagni` | Laziest-solution-that-works, in caveman speak. Build less + say less. |

## Add a skill

1. `mkdir skills/<name>`
2. Write `skills/<name>/SKILL.md` with frontmatter (`name`, `description` — description holds trigger words).
3. Add `"./skills/<name>"` to `.claude-plugin/plugin.json` → `skills`.
