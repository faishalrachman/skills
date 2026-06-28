---
name: grill-with-docs
description: >
  Grilling session that challenges your plan against the existing product & business docs (BRD, PRD,
  TRD/FRD, glossary), sharpens terminology, and updates those docs inline as decisions crystallise.
  Broad — not just software: business case, product, and technical requirements end-to-end.
  Use when user wants to stress-test a plan against their documented product/business decisions, says
  "/grill-with-docs", "grill against my docs", "challenge my PRD/BRD/TRD", or "update my docs as we go".
---

<what-to-do>

Interview me relentlessly about every aspect of this plan until we reach a shared understanding. Walk down each branch of the decision tree, resolving dependencies between decisions one-by-one. For each question, provide your recommended answer.

Ask the questions one at a time, waiting for feedback on each question before continuing.

If a question is already answered by the existing docs (or the codebase), consult those instead of asking.

</what-to-do>

<supporting-info>

## Doc awareness

This skill works across the whole product lifecycle, not just code. Before and during the session, look for existing documentation. See [DOC-TYPES.md](./DOC-TYPES.md) for what each artifact is, its sections, and how they flow (BRD → PRD → TRD/FRD).

### Typical structure

```
/
├── docs/
│   ├── brd.md            ← business requirements / the "why" and the case
│   ├── prd.md            ← product requirements / the "what" and "for whom"
│   ├── trd.md            ← technical requirements / the "how"
│   ├── glossary.md       ← canonical terms (the project's language)
│   └── decisions/
│       ├── 0001-pricing-model.md
│       └── 0002-build-vs-buy-auth.md
└── ...
```

Not every project has all of these — a small one may have only a `prd.md`. Infer which docs exist and which the current topic belongs in. If unclear, ask.

Create files lazily — only when you have something to write. If no `glossary.md` exists, create one when the first term is resolved. If no `decisions/` exists, create it when the first decision worth recording lands. Don't scaffold empty docs.

## During the session

### Challenge against the glossary

When the user uses a term that conflicts with the existing language in `glossary.md` (or a doc's defined terms), call it out immediately. "Your glossary defines 'activation' as X, but you seem to mean Y — which is it?"

### Sharpen fuzzy language

When the user uses vague or overloaded business/product terms, propose a precise canonical term. "You're saying 'user' — do you mean the buyer who pays or the end user who logs in? Those are different people with different needs."

### Discuss concrete scenarios

When relationships or flows are being discussed, stress-test them with specific scenarios — real user journeys, segments, pricing edge cases, failure paths. Invent scenarios that probe the boundaries and force the user to be precise.

### Cross-reference with the docs (and code)

When the user states how something works or what the product does, check whether the existing docs agree. If you find a contradiction, surface it: "Your PRD says onboarding is self-serve, but you just described a sales-assisted flow — which is right?" If there's code, check it too.

### Update the docs inline

When a decision crystallises or a term is resolved, update the relevant doc right there — the term goes in `glossary.md`, a scope call goes in `prd.md`, a tech constraint in `trd.md`. Don't batch these up; capture them as they happen.

Keep `glossary.md` a glossary — tight definitions of what each term IS, no implementation detail. Keep each requirements doc to its layer (business / product / technical) per [DOC-TYPES.md](./DOC-TYPES.md); don't smear a tech decision into the BRD.

### Record decisions sparingly

Only offer to record a decision (in `docs/decisions/`) when all three are true:

1. **Hard to reverse** — the cost of changing your mind later is meaningful (pricing model, build-vs-buy, target segment, platform).
2. **Surprising without context** — a future reader will wonder "why did they decide it this way?"
3. **The result of a real trade-off** — there were genuine alternatives and you picked one for specific reasons.

If any of the three is missing, skip it. Keep each decision record to a few sentences: the context, what was decided, and why. Number them sequentially (`0001-`, `0002-`, …).

</supporting-info>
