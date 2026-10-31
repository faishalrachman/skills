# English Writing Style

This style combines:

1. **The author's own English voice**: direct intent statements, explicit method steps, numbers tied to their condition, plain conclusions. Preserve that directness; fix its grammar traps (see §6).
2. **The best traits of the cited papers**: precise metric reporting with population and uncertainty, related work summarized as *what was shown and what was missing*, honest scope limits, and "not a substitute for the reference standard" restraint.

This guide controls **style only**. Topic, outline, and content come from the user. Examples use `{curly-brace slots}`; fill a slot only with user-supplied facts. Never output a `{slot}`.

---

## 1. Voice

- Formal, compact, technical. One claim per sentence. Sentences mostly 15–30 words.
- Active voice for what the study did; passive for protocol steps.
- Past tense for what was done and observed; present tense for interpretation and established facts.
- Name the actor precisely: `this study`, `the proposed method`, `the classifier`, `the reference standard`. Avoid `we` unless the user uses it.
- Define an abbreviation at first use, then use only the abbreviation: `{full term} ({ABBR})`.
- Report a number only with its metric, unit, population or data, and condition: `{metric} of {value} ({uncertainty}) in {N} {units}`.
- Hedging is graded, not decorative: `may`, `suggests`, `is associated with`, `indicates`. Use `demonstrates` or `causes` only when the design supports it.

---

## 2. Sentence patterns by function

Pick a variant; rotate them so the prose does not repeat one shape.

### 2.1 Definition and background

- `{Term} is defined as {definition} [n].`
- `{Term} refers to {definition} [n].`
- `{Condition} is the most common {category} encountered in {setting} [n].`
- `{Condition} is associated with a {N}-fold higher risk of {outcome} [n].`
- `{Condition} is asymptomatic in at least {proportion} of patients [n].`
- `Although {current approach} is widely used, {specific limitation} [n].`

### 2.2 Problem and gap

- `{Approach} has been shown to {capability} [n], but its performance in {target setting} remains unclear.`
- `{Method} achieved {metric} in {prior context}; whether this holds for {target context} has not been established.`
- `Prior studies were limited to {restriction}, so the results cannot be extrapolated to {target population}.`
- `A drawback of {method} is {limitation} [n].`
- `Comparisons with {prior work} are difficult because {difference in data or protocol}.`

### 2.3 Aim

- `The primary aim of this study was to {aim}.`
- `This study assessed {object} in {population or data}.`
- `We evaluated whether {method} could {capability} in {setting}.`
- `This paper proposes {method} for {task}.`

### 2.4 Method

- `{Object} were {collected/recorded} from {source} between {period}.`
- `{Object} were {preprocessed} to {technical purpose}.`
- `{Features} were extracted using {method} and used as input to {model}.`
- `The analysis was performed with {tool} version {v}.`
- `A segment was assigned to {class} if {criterion}.`
- `{Method} was chosen because {reason} [n].`
- `Performance was evaluated using {metrics} on {split or validation scheme}.`
- `{Object} were excluded if {criterion}.`
- `Two {experts} independently {action}; disagreements were resolved by {rule}.`

### 2.5 Results

- `Of {N} {units}, {n} ({p}%) {outcome}.`
- `{Method} achieved a {metric} of {value} ({CI}) and a {metric} of {value} ({CI}).`
- `{Method A} achieved a {metric} of {value}, compared with {value} for {method B} under the same conditions.`
- `{Method} correctly classified {n} of {N} {cases}, producing {n} false positives.`
- `The difference was {value} percentage points; {statistical test result, if supplied}.`
- `{Metric} did not change appreciably as {factor} increased.`

### 2.6 Interpretation

- `These results suggest that {inference}.`
- `{Pattern} may be explained by {mechanism}, because {evidence}.`
- `This finding is consistent with {author} [n], who reported {result}.`
- `In contrast, {author} [n] reported {result}, possibly because {difference}.`
- `Although {result} was observed, {alternative explanation} cannot be excluded.`
- `The higher {metric} for {group} may reflect {mechanism}.`

### 2.7 Limitation and scope

- `A limitation of this study is that {limitation}.`
- `Because {condition}, the results may not generalize to {population or setting}.`
- `{Method} is intended as a {role}, not as a substitute for {reference standard}.`
- `Direct comparison with {prior work} was not possible because {reason}.`
- `Whether these findings hold in {setting} remains to be determined.`

### 2.8 Conclusion

- `{Method} detected {target} with a {metric} of {value} in {scope}.`
- `These findings support the use of {method} as {bounded role}.`
- `External validation in {population} is required before {broader use}.`
- `Future work should examine {question left open by the limitation}.`

---

## 3. Combined paragraph examples

All content is slots. Follow the rhythm, not the words.

**Background → gap → aim**

> {Condition} is associated with {consequence} [n]. {Current approach} is used for {task}, but {specific limitation} [n]. Prior studies have evaluated {method} in {prior context}; its performance in {target context} remains unclear. The primary aim of this study was to {aim}.

**Related work synthesis**

> {Author} [n] proposed {method} for {task} and reported {metric} = {value}. {Author} [m] applied {method} to {data} and reported {metric} = {value}, but {restriction}. These studies used {condition}, whereas the present study used {condition}. Direct comparison is therefore limited to {aspect}.

**Method**

> {Object} were recorded from {source} during {period}. Signals were {preprocessed} to remove {artifact}. {Features} were extracted using {method} and used as input to {model}. Performance was evaluated against {reference} using {metrics} with {validation scheme}.

**Results**

> Of {N} {units}, {n} ({p}%) met {criterion}. {Method} achieved a {metric} of {value} ({CI}) and a {metric} of {value} ({CI}). {Comparator} achieved {value} and {value}, respectively.

**Discussion with limitation**

> In this study, {method} achieved {metric} of {value} in {setting}. This result is {comparable to/higher than/lower than} {author} [n], although {difference in data or protocol} limits direct comparison. {Mechanism} may explain {pattern}. A limitation is that {limitation}, which restricts {generalization}.

**Conclusion with scope**

> {Method} {verb} {target} with a {metric} of {value} in {scope}. These findings support its use as {bounded role}. {Method} is not a substitute for {reference standard}. External validation in {population} is required.

---

## 4. Edit examples (before → after)

| Before | After | Why |
|---|---|---|
| `In today's rapidly evolving field, {topic} is crucial.` | `{Topic} is associated with {consequence} [n].` | Delete scene-setting; open with evidence. |
| `The results clearly prove that {method} is superior.` | `{Method} achieved a {metric} of {value} on {data}.` | Claim replaced by measurement. |
| `{Method A} is better than {method B}.` | `{Method A} achieved {value}, compared with {value} for {method B} under the same conditions.` | Higher ≠ better without criterion. |
| `Many studies have shown {claim}.` | `{Author} [n] and {author} [m] reported {specific finding}.` | Name the source or flag it. |
| `The system serves as a comprehensive solution for {task}.` | `The system {specific function} for {task}.` | Copula inflation → concrete verb. |
| `{Event} marks a pivotal moment in {field}.` | `{Event} is the first {specific thing}.` | Importance puffery → fact. |
| `The model performed well.` | `The model achieved {metric} {value} ({CI}) in {N} {units}.` | Quantify. |
| `This may potentially lead to {outcome}.` | `This may lead to {outcome}.` | One hedge, not two. |
| `{A}, highlighting the importance of {B}.` | `{A}. {B} is therefore required for {purpose}.` | Remove interpretive `-ing` clause. |
| `In conclusion, this study has successfully demonstrated {claim}.` | `{Method} reached {metric} {value} in {scope}, supporting its use as {role}.` | Answer directly; no self-congratulation. |

---

## 5. Anti-AI-slop

Cutting only. Never add a dramatic opener, an anecdote, a new number, or an opinion that the source lacks.

### 5.1 Openers and framing to delete

| Pattern | Fix |
|---|---|
| `In the rapidly evolving world of ...` / `In today's ...` | Start with the subject or a statistic. |
| `It is important to note that ...` / `It is worth mentioning that ...` | Delete; state it. |
| `When it comes to {X}, ...` | `{X} ...` |
| `The question isn't {X}, it's {Y}.` / `This is not {X}; it's {Y}.` | State `{Y}` directly. |
| `What most people miss is ...` / `The part everyone overlooks is ...` | Delete the stage; make the claim. |
| `Let us dive into ...` / `Let's explore ...` | Delete. |
| `Here's the thing:` / `Plot twist:` | Delete. |

### 5.2 Claims to remove

| Pattern | Fix |
|---|---|
| `plays a vital role in ...` | `is used for ...` or name the measured effect. |
| `stands as a testament to ...` / `marks a pivotal moment ...` | State the event or result. |
| `underscores the significance of ...` | Delete; show the consequence. |
| `Experts agree` / `studies suggest` (no citation) | Name the source or flag `[needs citation]`. |
| `This is a game changer.` | State the measured difference. |
| `robust, cutting-edge, seamless, comprehensive, holistic, novel` | Replace with the measured property (`stable across {condition}`, `{value} lower error`). |

### 5.3 Sentence shapes to fix

- **Circular restatement**: the next sentence must not repeat the previous claim in other words (`SVM classified the signal. Classification was performed with SVM.`). Every sentence adds something: definition, number, condition, mechanism, or consequence.
- **Trailing `-ing` interpretation**: `{X}, highlighting/underscoring/reflecting ...` → split into a factual consequence.
- **Colon reveal**: `The key detail: {X}.` → write a normal sentence.
- **Dramatic fragments**: `{X}. And {Y}.` → full sentences.
- **Forced rule of three**: use as many items as the evidence warrants.
- **Synonym cycling**: repeat the correct technical term; `students → learners → participants` confuses.
- **Summary recap**: `In conclusion, ...` followed by repetition → answer the aim once.
- **Fake-profound closer**: delete; end on the last concrete finding.
- **Em dashes**: at most one per page; prefer commas or a second sentence.

### 5.4 Never inject while rewriting

Fabricated first-person experience, invented specifics (numbers, names, dates, tools), manufactured stakes, invented contrarian foils, performed candor, dashes for drama, or fragments chopped for rhythm.

### 5.5 Technical exceptions

Domain terms stay even when they trip a word list: `robust estimator`, `robust control`, `seamless integration` in a system description that is actually measured, `novel` only if the novelty is stated against named prior work. Keep necessary hedges, quantification, and reported uncertainty.

---

## 6. Indonesian-to-English transfer traps

The author's own English abstracts show these; fix them silently in EDIT, and never introduce them in WRITE.

| Indonesian habit | Correct English |
|---|---|
| `this final task proposes` / `this research tries to improve` | `this study proposes` / `this study aims to` |
| `Several years many researcher has been widely proposed method` | `Several studies have proposed methods` |
| `The accuracy value obtained ... is strongly influenced by` | `Accuracy depends on` |
| `successfully achieved an average accuracy 96.17%` | `reached a mean accuracy of 96.17%` (no `successfully`) |
| `can perform real time PVC detection` | `performs PVC detection in real time` |
| `There are 3 stages in detecting PVC` | `Detection involved three stages:` |
| `No less important this final task also to do analysis` | `This study also evaluated` |
| Mixed decimal points across sections | Use one convention consistently; report the same values as the Indonesian abstract |
| `specicity`, `classication`, `in uenced` | `specificity`, `classification`, `influenced` |

Also check: singular/plural agreement, article use (`a/the`), countability (`data were`, `information is`), and `et al.` formatting.

---

## 7. Final check

- [ ] Opens with a definition, statistic, or precise aim.
- [ ] Every number has metric, value, condition, and population or data.
- [ ] Related work names the author and the specific finding.
- [ ] Interpretation is separated from reported data.
- [ ] Limitations are stated; no claim exceeds design or data.
- [ ] No `{slot}` left; no invented fact, metric, or citation.
- [ ] Anti-AI-slop patterns removed; no personality or specifics injected.
- [ ] Terminology and abbreviations consistent; decimal convention consistent with the Indonesian version.
