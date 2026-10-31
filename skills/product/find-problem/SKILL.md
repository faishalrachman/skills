---
name: find-problem
description: >
  Surprise the user with 5–7 monetizable problem wedges to build a small profitable product around.
  Biased to boring, painful, already-paid-for B2B problems reachable by direct outreach. Each candidate
  is drilled to its root cause with 5-Whys, and the wedge targets the root, not the symptom. Search-backed.
  Use when user says "/find-problem", "find a problem", "find me a problem", "monetizable wedge",
  "what should I build", "surprise me with ideas", or names a domain to hunt opportunities in.
---

# Find a Problem — surprise me with monetizable wedges

Optional focus (domain, industry, or constraint): whatever the user passed when invoking this skill. If they passed nothing, range freely.

Respond in the user's language. Use web search to ground ideas in real, current complaints and spending — not generic startup tropes.

## Calibration
Default profile: solo founder, software + product background, no audience yet, wants a small profitable win.

Bias toward:
- B2B over B2C — easier to charge.
- Niches that already spend money on tools or freelancers.
- Buildable solo in weeks, not months.
- Markets reachable by direct outreach, not paid ads or virality.

Avoid:
- Crowded consumer apps, heavy-regulation spaces, anything needing a big audience on day one, or two-sided marketplaces that need both sides at once.

If the user named a domain they have access to, prioritize it — unfair access beats a bigger market.

## Every complaint is a symptom

A visible complaint ("we lose deals in the spreadsheet", "onboarding takes three weeks") is a symptom. Selling relief from the symptom puts you in a crowded market with price pressure. The money sits at the root cause: the process, policy, missing control, or design assumption the buyer already pays for, badly.

So each candidate goes through a root-cause drill before it gets a wedge.

### The drill

1. **State the symptom as observable fact, with cost.** Who, how often, how much time or money. Vague ("teams struggle with X") is not a starting point.
2. **Ask why, 4–6 times.** Each answer explains the level above it. Stop early only if the next "why" has no actionable answer.
3. **Attach evidence at every level.** Search result, job post, tool pricing page, forum thread, review complaint, public postmortem, or interview note. No evidence = mark `assumption` and say so.
4. **Allow branches.** Most real problems have 2–3 contributing causes. Drill the branch the payer controls; note the others.
5. **Stop at a root the buyer can act on:** a process that can be changed or automated, a missing control or check, a knowledge gap, a design flaw, a policy gap, or a resource decision.
6. **Validate backwards.** If the root were fixed, would each higher level disappear? If the chain breaks, the root is wrong — redrill that level.

### Root test

A usable root cause is: **actionable** (someone can change it), **preventive** (fixing it stops recurrence), **fundamental** (asking why again yields nothing new), **verifiable** (evidence exists).

Symptom relief sells once. Root removal sells repeatedly, because the cause keeps generating the symptom.

### Root categories (pick one, it shapes the wedge)

| Category | Root statement shape | Wedge shape |
|---|---|---|
| Process gap | Manual step where automation fits | Automate that step |
| Policy gap | No standard, so each team improvises | Enforce one standard |
| Missing control | No check catches the failure before the customer does | Add the check |
| Knowledge gap | Team lacks the skill or the reference | Training, checklist, reference tool |
| Design flaw | The workflow assumes X that stopped being true | Rework around the new assumption |
| Scaling assumption | Built for volume that no longer holds | Fix the ceiling |
| Incentive misalignment | Two teams are paid to do opposite things | Reconcile the metric |
| Compliance gap | Rule exists, nobody tracks it | Track and evidence it |

### Anti-patterns

- **Stopping at the symptom.** "Too many spreadsheets" is not a root; why do spreadsheets exist here?
- **Blame.** "The ops lead is careless" is not a cause. Ask what the process allowed.
- **Vendor excuse.** "The API is unreliable" → why is there no fallback?
- **Single thread.** One chain hides the cause the buyer actually controls.
- **Unverified why.** Every level carries evidence or an explicit `assumption` label.
- **Big-market hand-wave.** "Huge market" is not demand. Who pays today, and for what?

## Output

Generate 5–7 candidate problems. For each:
- The problem, one line, stated as symptom with cost.
- Who feels it, how acutely, and who signs the cheque.
- **Root-cause chain:** 4–6 rows of `why → answer → evidence`, ending in one root statement and its category.
- Evidence it's real (search-backed where possible; label assumptions).
- How it's solved or paid for today, and why that leaves the root unfixed.
- Wedge idea: the narrow first thing you'd sell that removes the root.
- Symptom-only trap: the obvious product someone else will build, and why it commoditizes.

Then a ranked shortlist (top 3) by root severity × willingness to pay × reachability, with one-line reasoning. Offer to push any pick into `/product-research` (or `/grill-business` to pressure-test the buyer).

Prefer boring, painful, already-paid-for problems over exciting novel ones. A boring root cause with a budget line beats a novel symptom with applause.
