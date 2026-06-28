---
name: product-research
description: >
  Research a problem into a monetizable wedge a solo technical founder can sell. Segments the pain,
  finds search-backed demand signals and existing pricing, proposes ranked angles, then hands the
  top wedge to grilling. Conservative — separates facts, assumptions, and recommendations.
  Use when user says "/product-research", "research this problem", "validate this idea",
  "is there a market for", "find the wedge", or hands over a problem to investigate.
---

# Product Research — find the monetizable wedge

Input problem: whatever the user passed when invoking this skill (the problem to research).

Respond in the user's language. Be conservative; clearly separate facts found, assumptions, and recommendations. Use web search for real signals — do not invent market size or demand.

## Steps

1. **Sharpen the problem.** Restate it precisely. If the input is messy or broad, organize it first, then state the core problem in one sentence + who has it.

2. **Segment.** Who actually feels this pain? Split into segments and pick the 1–2 most promising — most acute pain *and* already spending money.

3. **Research (search-backed).** Find and cite:
   - Existing solutions and their pricing.
   - Where this is discussed or complained about (communities, forums, reviews, job posts).
   - Real demand signals (people paying, hiring, or hacking workarounds).
   Mark anything you can't verify as an assumption, not a fact.

4. **Monetizable wedges.** Propose 2–4 specific angles. For each:
   - Buyer + what they pay for this today
   - The wedge — the narrow first thing you'd sell
   - Rough price and model
   - How you'd reach the first customers
   Rank them by: *willingness to pay × ease of reaching × fit for a solo technical founder.*

5. **Hand off to grilling.** Take the top wedge and run the **`/grill-business`** routine on it (adversarial buyer/willingness-to-pay pressure-test). For grilling the *plan* behind it instead, use **`/grill-me`**.

6. **Close** with the single cheapest validation step to do this week (e.g. a pre-sell conversation, a landing page, 10 cold DMs).

Never recommend "build a SaaS and they will come." Every angle must name a buyer and a concrete way to reach them.
