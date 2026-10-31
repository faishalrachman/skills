---
name: nulis
description: Writes, edits, audits, and translates academic technical text in the author's personal Indonesian or English writing style, calibrated from the author's latest thesis writing plus the strongest traits of the papers they cite. Use when the user types /nulis or asks to write or revise skripsi, TA, proposal, jurnal, paper, abstrak, or any thesis/paper section.
---

# Nulis

This skill controls **writing style only**: sentence shapes, transitions, word choice, how sources and numbers are woven in, tense, and tone. It does **not** prescribe a topic, a chapter outline, or section content.

## Step 1 — Read the style guide

| Output language | Read |
|---|---|
| Indonesian | `INDONESIAN_WRITING.MD` |
| English | `ENGLISH_WRITING.MD` |
| Translation, or Indonesian text plus English abstract | both; write in the target language's guide |

Read the whole guide before writing. The pattern examples define the voice: imitate their rhythm, connectors, and sentence order.

## Step 2 — Structure and content come from the user

- Use the user's outline, the user's draft structure, or the venue/institution template. If none is given, use the minimum structure the request implies. Do not impose a fixed chapter skeleton.
- Content (topic, claims, data, citations) comes only from the user.
- The guides use `{curly-brace slots}` in examples. These are slots, not text. Never output a `{slot}`. Fill it with a user-supplied fact, or write `[butuh data: ...]` / `[needs data: ...]`.

## Step 3 — Classify the task

`WRITE` · `EDIT` · `AUDIT` (report problems, no rewrite) · `SUMMARIZE` · `TRANSLATE`.

Identify document stage because tense changes:

- **Proposal / plan**: planned voice (`akan dilakukan`, `will be evaluated`, `diharapkan`). No results.
- **Final report / paper**: past voice for what was done; numbers for findings.

## Step 4 — Evidence rules

1. Never invent references, authors, years, DOI, datasets, sample sizes, parameters, metrics, results, or statistics.
2. External claim without a supplied source: `[butuh sitasi: klaim]` / `[needs citation: claim]`. Never invent a citation number or author-year.
3. Results/discussion requested without numbers: ask for them. If the user insists on a draft, write it with `[butuh data: ...]` slots and list them in the notes.
4. Do not strengthen claims: higher ≠ superior; association ≠ cause; one dataset ≠ general; `signifikan/significant` only with a supplied statistical test.
5. In EDIT, keep the user's meaning, numbers, structure, and citation numbering. Fix style, grammar, wrong terms, and wrong formulas; flag factual problems instead of silently changing them.

## Step 5 — Missing input

Ask one short question in the user's language and stop:

- `Apa topik dan tujuan tulisannya?` / `What are the topic and objective?`
- `Kirim hasil/angka yang mau dibahas. Saya tidak akan mengarang hasil.` / `Send the results to discuss. I will not invent findings.`
- `Kirim referensinya. Saya tidak akan mengarang sitasi.` / `Send the references. I will not invent citations.`

## Step 6 — Output

Headings follow the output language.

- **WRITE**: text, then `Catatan penulis` / `Author notes` only if slots or decisions remain.
- **EDIT**: full revised text, then `Perubahan` / `Changes` (max 5 real changes).
- **AUDIT**: table `Lokasi | Masalah | Alasan | Perbaikan`.
- **SUMMARIZE**: objective, method/data, findings, limitations; missing → `tidak disebutkan dalam sumber`.
- **TRANSLATE**: translated text; same numbers in both languages.

## Step 7 — Final check

- Text reads like the guide's pattern examples, not like a generic assistant.
- No `{slot}` left; no invented fact, number, or citation.
- The guide's correction list and anti-AI-slop section were applied.
- Tense matches the document stage.
- Signature connectors used naturally, not stacked in every sentence.
- Nothing was added that the source lacked: no new numbers, experiences, opinions, or dramatic framing.
