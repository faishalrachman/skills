# Product & Business Doc Types

A quick reference for the documents this skill grills against and updates. The point isn't to fill out every template — it's to know which layer a given decision belongs in, so the right doc gets sharpened and others stay clean.

## The flow

```
BRD ──────────▶ PRD ──────────▶ TRD / FRD
why & the case   what & for whom   how (build)
business owner    product owner     engineering
```

Each layer answers a different question and is owned by a different hat. A decision smeared across the wrong layer is the most common mess: keep the *why* out of the TRD and the *how* out of the BRD.

## BRD — Business Requirements Document
**The "why."** The business case for doing this at all. Audience: stakeholders / sponsors who approve spend.

Core sections:
- **Problem / opportunity** — what business pain or opening this addresses.
- **Goals & success metrics** — the business outcome (revenue, retention, cost saved) and how it's measured.
- **Scope & constraints** — what's in, what's out, budget/time/regulatory limits.
- **Stakeholders** — who cares, who decides, who's affected.
- **Assumptions & risks** — what must hold true; what could sink it.

Write a BRD when spend or strategic direction needs sign-off. Skip it for a solo build with no approval gate — fold the "why" into the PRD instead.

## PRD — Product Requirements Document
**The "what" and "for whom."** Translates the business case into a product. Audience: design + engineering.

Core sections:
- **Value proposition** — one sentence.
- **Target user / persona** — the specific person, not "businesses."
- **Jobs-to-be-done / user stories** — the outcomes they hire the product for.
- **Core flows** — the paths the product must do well, step by step.
- **Requirements** — functional (what it does) and non-functional (performance, security, accessibility).
- **Out of scope** — explicitly what you're NOT building yet.
- **Success metric** — the one metric that proves it works.

The PRD is the workhorse. Most projects need this even if they have nothing else.

## TRD — Technical Requirements Document
**The "how."** How the product gets built. Audience: engineers.

Core sections:
- **Architecture overview** — components and how they fit.
- **Data model** — entities, fields, relationships.
- **APIs / interfaces / integrations** — contracts with other systems.
- **Non-functional targets** — concrete numbers (latency, throughput, uptime).
- **Tech choices & trade-offs** — stack, build-vs-buy, the ones with lock-in.
- **Risks / open questions** — the riskiest pieces to resolve first.

Write a TRD when the build is non-trivial or more than one person implements it. A small solo build often skips it.

## FRD — Functional Requirements Document
**The detailed "what it does."** Sometimes split out of the PRD when behaviour is complex: exhaustive functional specs, input/output rules, state transitions, business rules, acceptance criteria. Fold it into the PRD unless the detail genuinely warrants its own doc.

## Supporting artifacts

- **glossary.md** — the project's canonical language. Tight definitions of what each term IS, picking one word when several compete. No implementation detail. This is what `/grill-with-docs` sharpens terms against.
- **docs/decisions/** — short records of hard-to-reverse, surprising, real-trade-off decisions (pricing model, target segment, build-vs-buy). A few sentences each, numbered sequentially. The product/business analog of an ADR.

## Which doc gets the decision?

| The decision is about… | It belongs in… |
|------------------------|----------------|
| Whether to do this, budget, business goal | BRD |
| Who the user is, what the product does, scope | PRD |
| How it's built, data, APIs, tech choice | TRD |
| What a term means | glossary.md |
| A hard-to-reverse trade-off + its reasoning | docs/decisions/ |
