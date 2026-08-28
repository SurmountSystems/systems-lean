# Mult term-surface gap table (2026-08-08)

Kind: analysis only. Not residual invent beyond the named queue.
Not free flip. Not DualResidual re-open. Not FullHostElaborateRemains re-true.
Not product free / complete / PROVABLY re-open. Not full elaborator parity claim.
Not mathlib product dependency. Not full classic Lean 4 package typecheck claim.
Not TERM-SURFACE dual-ok forge. Not HostModuleCheck L2 judgment implement.

ASCII only. Plain American English. Date: 2026-08-08.

**Program slice:** FullHost gap close (IMPL **gapc2026**) after Real elaborator
judgments design. This note is the Mult **L2 term-surface gap table** (design
section 7a).

**Prior (do not re-run from zero):**

| Artifact | Role |
|----------|------|
| `real-elaborator-judgments-design-2026-08-08.md` | L0-L4 layers; L2 = TERM-SURFACE = J5+J6; Mult pilot recommended |
| `check-depth-gap-inventory-2026-08-08.md` | HostModuleCheck vs cold lake sample; Mult kind-surface row |
| `.agents/reports/impl-fullhost-gap-close-2026-08-08.md` | Living tip after kind-surface + judgments design |
| `HostModuleCheckRequiredDecls.lean` | Living Mult / MultTheorems required token lists |
| `HostModuleCheckSurface.lean` | `extractKeyDecls` (form + name only; no types) |
| `HostModuleCheckFixtureTexts.lean` | Good Mult / MultTheorems structural fixtures |

---

## 1. Living tip (measured)

| Surface | Living value |
|---------|--------------|
| HostModuleCheck depth honesty | **PARTIAL-STRUCTURAL** (seed modules=**206**) |
| Deepen bar | **FOUNDATION-KIND-SURFACE** |
| Mult in deepen band | Yes (Mult + MultTheorems in Mult..Extract) |
| Without-Lake recipe | `just host-module-check-without-lake` (modules=206) |
| Cold Mult elaborate | `lake build SystemsLean.Mult` **exit 0** (2026-08-08 this slice) |
| Cold MultTheorems elaborate | `lake build SystemsLean.MultTheorems` **exit 0** (2026-08-08 this slice) |
| FullHostElaborateRemains | **false** (unchanged) |
| Host residual free | **claimed** F1 (unchanged) |
| Full classic elaborator parity | **open** (unchanged) |
| Proposed depth token `TERM-SURFACE` | **not dual-ok** (no L2 checks yet; do not mint true greps) |

---

## 2. Goal of this table

Name, for Mult (and MultTheorems where useful), which **living HostModuleCheck
L0/L1 tokens** are grepped today, which **real Mult.lean / MultTheorems.lean
defs and theorems** cold Lake typechecks, and which **ill-typed twins** would
still pass L0/L1 while Lake would reject. That evidence feeds a checkable next
residual **Mult term-surface pilot** (L2 = J5 definition typing + J6 inductive
formation on Mult only).

This note **does not implement** judgments in HostModuleCheck product Lean.

---

## 3. How L0/L1 actually checks Mult

Source: `extractKeyDecls` in `HostModuleCheckSurface.lean` +
`multRequiredDecls` / `multTheoremsRequiredDecls` + `checkNamedSurface`.

| Layer | What is checked | What is not checked |
|-------|-----------------|---------------------|
| **L0 Structural** | Package-local imports (where required); expected namespace; non-empty body; presence of each required `kind:name` token | Types, binders, bodies, ctor lists, proof terms |
| **L1 Kind surface** | Same as L0 for Mult band, plus required **kind** prefixes (`inductive:` / `def:` / `theorem:`) so a bare string is not enough | Well-formed telescopes, application typing, equality of statement to real Mult API |

**Token extraction rule (honest):** a line that parses as `inductive Name`,
`def Name`, or `theorem Name` contributes exactly one greppable key
(`inductive:Name`, `def:Name`, `theorem:Name`). Return type, parameters, match
arms, and proof bodies are **ignored**.

**Existing Mult-related reject fixtures (L0/L1 only):** missing inductive Mult;
missing namespace; empty module; missing theorem name on MultTheorems-style
checks. There is **no** living reject for wrong Mult return type, wrong ctor
arity, or ill-typed Mult application.

---

## 4. Mult.lean: living tokens vs real Lake surface

Module path: `src/systems/SystemsLean/Mult.lean` (~90 lines).
Namespace: `SystemsLean.Mult`. Cold lake: **exit 0**.

### 4a. Required HostModuleCheck tokens (L0/L1)

From `multRequiredDecls` (length 6; dual-pinned LoadOk):

| Token | Kind | On-disk Mult.lean? |
|-------|------|--------------------|
| `inductive:Mult` | inductive | yes |
| `def:name` | def | yes |
| `def:isValid` | def | yes |
| `def:ofNat?` | def | yes |
| `def:isValidTag` | def | yes |
| `def:multIsValid` | def | yes |

No Mult `structure:` / `axiom:` tokens (honest: Mult has none).

### 4b. Real Mult.lean constructs Lake typechecks

| Construct | Claimed type / form (plain English) | Lake role |
|-----------|-------------------------------------|-----------|
| `inductive Mult` | three nullary ctors: `mult0`, `mult1`, `multOmega`; `DecidableEq`, `Repr` | J6 inductive formation |
| `def name` | `Mult -> String`; match three ctors to greppable grade strings | J5 definition typing |
| `def isValid` | `Mult -> Bool`; match three ctors to `true` | J5 |
| `def ofNat?` | `Nat -> Option Mult`; tags 0/1/2 some, else none | J5 (FAIL-CLOSED-UNKNOWN-GRADE) |
| `def isValidTag` | `Nat -> Bool` := `(ofNat? n).isSome` | J5 composition |
| `def multIsValid` | `Mult -> Bool` := `isValid m` | J5 alias |

**Not on Mult.lean:** theorems (live in MultTheorems long-file split).

### 4c. Good Mult fixture vs real module (L0/L1 honesty)

`hostModuleCheckGoodMultText` is a **structural skeleton**, not a Mult twin:

| Aspect | Real Mult.lean | Good fixture (HostModuleCheck) |
|--------|----------------|--------------------------------|
| inductive Mult 3 ctors | yes | yes |
| `name` match completeness | all three ctors | only `mult0` arm shown |
| `isValid` | three arms | `| _ => true` |
| `ofNat?` | 0/1/2/none | only 0 / `_` |
| Types / apps | full | not checked; fixture only needs tokens |

L0/L1 **accept** both. Cold lake on the **real** path is green; the good
fixture is not claimed to be a lake-green Mult module body.

---

## 5. MultTheorems.lean: tokens vs real theorems (L3-relevant)

Module path: `src/systems/SystemsLean/MultTheorems.lean` (~148 lines).
Same namespace `SystemsLean.Mult`. Cold lake: **exit 0**.

### 5a. Required theorem tokens (L1 corpus)

From `multTheoremsRequiredDecls` (14 theorems; A56 deepen):

| Token | Real theorem on disk? |
|-------|------------------------|
| `theorem:ofNat?_zero` | yes (`rfl`) |
| `theorem:ofNat?_one` | yes |
| `theorem:ofNat?_two` | yes |
| `theorem:ofNat?_fail_closed` | yes (cases + decide) |
| `theorem:isValidTag_zero` | yes |
| `theorem:isValidTag_one` | yes |
| `theorem:isValidTag_two` | yes |
| `theorem:isValidTag_fail_closed` | yes |
| `theorem:isValid_true` | yes (cases) |
| `theorem:multIsValid_eq_isValid` | yes |
| `theorem:name_mult0` | yes |
| `theorem:name_mult1` | yes |
| `theorem:name_multOmega` | yes |
| `theorem:isValidTag_eq_ofNat?_isSome` | yes (real: `isValidTag n = (ofNat? n).isSome`) |

### 5b. On-disk theorems **not** in required list (extra corpus)

| Theorem | Note |
|---------|------|
| `ofNat?_some_implies_isValidTag` | FAIL-CLOSED honesty; L1 optional |
| `ofNat?_name_zero` / `_one` / `_two` / `_fail_closed` | name o ofNat? compose |

L1 does not require these; gap for L3 later if corpus expands.

### 5c. Good MultTheorems fixture vs real proofs

`hostModuleCheckGoodMultTheoremsText` greps theorem **names** only. Several
bodies are `by sorry` or even `True := trivial` (for
`isValidTag_eq_ofNat?_isSome`), which **L0/L1 still accept**. Real MultTheorems
uses real proofs (no sorry). That is the core L1 vs Lake / L3 gap for proofs.

**Pilot scope recommendation:** L2 Mult term-surface pilot stays on **Mult.lean
defs/inductive only**. MultTheorems remains **L3 MultTheorems proof-surface
pilot** (design section 7b order 3), not mixed into Mult L2 Done when.

---

## 6. Twin table: good vs ill-typed (L0/L1 still accept bad)

Legend:

- **Lake good** = cold `lake build SystemsLean.Mult` (or MultTheorems) exit 0 on
  real path, or would accept a well-typed edit.
- **Lake bad** = elaborator type error / formation error (would reject).
- **L0/L1** = HostModuleCheck token + namespace check on the sketched twin text.

### 6a. Mult L2-relevant twins (primary pilot evidence)

| Id | Twin sketch (plain English) | Real / good path | Ill-typed / broken twin | Lake on good | Lake on bad | L0/L1 on bad | Gap class |
|----|-----------------------------|------------------|-------------------------|-------------:|------------:|-------------:|-----------|
| T1 | Inductive Mult present | `inductive Mult` 3 nullary ctors | Same header line + only **two** ctors, or ctor spelled so match arms in defs break | 0 | reject (non-exhaustive match in real defs) or ok if defs updated; pure formation still weak | **accept** if `inductive:Mult` line remains | J6 formation / exhaustiveness not grepped |
| T2 | Wrong return type on `name` | `def name : Mult -> String` | `def name : Mult -> Nat` with string arms or Nat arms | 0 | **reject** (type mismatch) | **accept** (`def:name`) | **J5** primary |
| T3 | Ill-typed application in body | `multIsValid m := isValid m` | `multIsValid m := isValid Mult.mult0 m` (extra arg) | 0 | **reject** | **accept** (`def:multIsValid`) | **J5** primary |
| T4 | Wrong domain on `ofNat?` | `Nat -> Option Mult` | `def ofNat? : Bool -> Option Mult` with Nat patterns | 0 | **reject** | **accept** (`def:ofNat?`) | **J5** |
| T5 | Nonsensical match result type | `isValid : Mult -> Bool` | arms return `String` / `none` | 0 | **reject** | **accept** (`def:isValid`) | **J5** |
| T6 | Missing required def name | full Mult surface | drop `def isValidTag` entirely | 0 | may still lake-green Mult if nothing else needs it | **reject** (`reasonMissingDecl`) | L0/L1 already covers **name** missing only |
| T7 | Semantic fail-closed hole (well-typed) | `ofNat?` rejects n>2 | `ofNat?` maps unknown to `some multOmega` | 0 | **accept** (still well-typed) | **accept** | Not a type gap; product contract / tests, not L2 alone |

**Read T7 carefully:** L2 term surface rejects **ill-typed** twins. Semantic
FAIL-CLOSED-UNKNOWN-GRADE stays MultTheorems + behavioral honesty; do not sell
L2 as full Mult contract checker.

### 6b. MultTheorems L3-relevant twins (out of Mult L2 pilot)

| Id | Twin sketch | Good | Bad | Lake good | Lake bad | L0/L1 bad | Gap class |
|----|-------------|------|-----|----------:|---------:|----------:|-----------|
| P1 | Named theorem present | real `ofNat?_zero` | `theorem ofNat?_zero : True := trivial` | 0 | may accept True (wrong statement!) | **accept** | Statement not checked (L3 + real statement identity) |
| P2 | Proof body | real cases proof | `by sorry` (fixture already) | 0 | accept with sorry | **accept** | J7 proof check absent |
| P3 | Ill-typed proof | real `rfl` | `theorem name_mult0 : name Mult.mult0 = "MULT-0" := rfl` after `name` returns Nat | 0 | **reject** | **accept** if theorem line + Mult tokens remain | Needs Mult L2 + L3 together |
| P4 | Missing theorem token | full corpus | drop `ofNat?_fail_closed` | 0 | may lake-green | **reject** | L1 name presence only |

---

## 7. What greps still do / do not do (Mult band)

**Still do (after this table; unchanged product):**

- Require Mult inductive + five defs by greppable kind:name.
- Require MultTheorems 14 theorem names.
- Reject missing inductive / missing theorem name / empty / wrong namespace.

**Still do not do:**

- Type terms or binders (J5).
- Validate inductive ctor telescopes / positivity beyond the word `inductive` (J6).
- Check proof terms (J7).
- Reject ill-typed twins T2-T5 that keep token spellings.
- Claim `TERM-SURFACE` dual-ok.

---

## 8. Concrete pilot candidate set (Mult L2 only)

Small, checkable, Mult.lean only. Prefer smallest judgment that rejects a real
ill-typed twin over day-one full Lean 4 elaborator (judgments design dialect
posture).

| Priority | Candidate | Judgment | Good evidence | Bad twin (must reject under L2) | Why small |
|---------:|-----------|----------|---------------|----------------------------------|-----------|
| 1 | `def name` typing | J5 | real Mult `name` or reduced good fixture with full type Mult -> String | T2 wrong return type | One def; greppable strings optional later |
| 2 | `def multIsValid` application | J5 | `isValid m` well-typed | T3 extra argument | Tiny composition |
| 3 | `inductive Mult` nullary formation | J6 | three nullary ctors | optional: non-name-preserving formation break that still says `inductive Mult` | Mult has no params/indices |
| 4 | `def ofNat?` typing | J5 | Nat -> Option Mult | T4 wrong domain | FAIL-CLOSED surface; still typing only |
| Hold for L3 | MultTheorems bodies | J7 | real proofs | P1/P2 statement/sorry twins | Separate residual |

**Recommended day-one pilot bar (minimum):**

1. Accept a documented Mult good fixture (or real Mult.lean path) under L2 for
   candidates 1-2 (and preferably 3).
2. Reject **at least two** ill-typed twins among T2, T3, T5 (L0/L1 still accept).
3. E-lake: cold `lake build SystemsLean.Mult` exit 0 on good path.
4. Do **not** flip `TERM-SURFACE` dual-ok until E-good/E-bad/E-lake/E-without-lake
   and dual-pin agree; FullHost stays false.

**Sub-1-KLOC constraint (pilot implementers):**
`HostModuleCheckFixtureTextsLater.lean` is ~996 lines. Do **not** grow Later
without a role split. Prefer new role module (e.g. term-fixture companion) or
thin additions in `HostModuleCheckFixtureTexts.lean` / Checkers headroom before
minting L2 bodies. RequiredDecls / Surface / Checkers still under 1000 today.

---

## 9. Done when: next residual Name **Mult term-surface pilot**

Pilot is **one residual**, not design-held, because Mult is tiny (1 inductive +
5 defs) and the twin set above is checkable without package-wide elaborate.

| Field | Content |
|-------|---------|
| **Name** | Mult term-surface pilot |
| **Goal** | Land L2 (J5 + optional J6) judgments for Mult.lean defs/inductive only so HostModuleCheck rejects named ill-typed Mult twins that L0/L1 still accept. |
| **Done when** | (1) Documented Mult dialect subset for L2 (nullary inductive Mult + simple Mult defs; not full Lean 4). (2) E-good: named well-typed Mult fixture or real Mult path accepted by L2 path. (3) E-bad: at least two ill-typed twins from T2/T3/T5 (wrong `name` return type; ill-typed `multIsValid` app; wrong `isValid` arm type) **rejected** by L2; same twins still described as L0/L1-accept if tokens present. (4) E-lake: `lake build SystemsLean.Mult` exit 0 on good path (lake on PATH; else BLOCKED not GREEN). (5) E-without-lake: day-to-day host-module-check without-Lake still exit 0 on seed (modules=206 or measured successor). (6) E-dual-pin: HostModuleCheck + HostResidualShrink + Theorems + just greps agree; depth token `TERM-SURFACE` dual-ok **only** if real rejects work and honesty strings say Mult pilot only (not package elaborate). (7) E-sub1kloc: all touched HostModuleCheck*.lean under 1000 (split fixture companion first if Later headroom insufficient). (8) E-hygiene: `just hygiene` green. (9) E-no-forge: FullHostElaborateRemains **false**; DualResidual free dual-ok **unchanged**; free/complete/PROVABLY **unchanged**; no full classic elaborator parity claim; MultTheorems L3 not required this Name. |
| **Out of scope** | MultTheorems proof-surface (L3); package elaborate L4; FullHost re-true; free/parity flip; mathlib; growing shell/Python mills; forging TERM-SURFACE true without E-bad rejects. |
| **Primary paths** | `HostModuleCheck*.lean` (checkers/fixtures/required as needed); optional new term-fixture role module; `HostResidualShrink*.lean`; just host recipes; residual/handoff/WATCHER/report. Read Mult.lean as SSOT of Mult dialect. |
| **Gates** | lake Mult; without-Lake module-check; systems-host dual-pin as needed; hygiene; Sub-1-KLOC. |

**If implement discovers dialect too large:** split only by **evidence**, not by
fear: e.g. residual A = Mult `name`+`multIsValid` J5 twins only; residual B =
inductive Mult J6. Do not empty Open with done-for-now while pilot Done when
above remains checkable.

---

## 10. Residual lockstep intent (this slice)

| Action | Intent |
|--------|--------|
| Done **Mult term-surface gap table** | This research note + residual + WATCHER + handoff + hygiene |
| Next Open | **Mult term-surface pilot** (implement; checkable Done when in section 9) |
| Pins | **No flip** FullHost, DualResidual free, proof complete, product free/complete/PROVABLY |
| Product Lean judgments | **None** this slice |

---

## 11. Non-claims (this slice)

- Does **not** implement L2/L3 judgments in HostModuleCheck
- Does **not** mint or dual-ok `TERM-SURFACE` / `PROOF-SURFACE` / `PACKAGE-ELABORATE`
- Does **not** re-true FullHostElaborateRemains or re-open free/parity theater
- Does **not** claim Mult good fixtures are full Mult lake bodies
- Does **not** treat semantic FAIL-CLOSED holes (T7) as L2 type rejects alone
- Does **not** claim MultTheorems L1 corpus equals full MultTheorems on-disk set

---

## 12. Pointers

| Artifact | Role |
|----------|------|
| This note | Mult L2 twin gap table + pilot Done when |
| `real-elaborator-judgments-design-2026-08-08.md` | J1-J14; L0-L4; evidence gates |
| `check-depth-gap-inventory-2026-08-08.md` | Pre-expand Mult kind-surface sample |
| `HostModuleCheckRequiredDecls.lean` | multRequiredDecls / multTheoremsRequiredDecls |
| `HostModuleCheckFixtureTexts.lean` | Good Mult / MultTheorems structural text |
| `Mult.lean` / `MultTheorems.lean` | Real Lake-typechecked Mult surface |
| `.agents/reports/impl-fullhost-gap-close-2026-08-08.md` | gapc2026 living report |
