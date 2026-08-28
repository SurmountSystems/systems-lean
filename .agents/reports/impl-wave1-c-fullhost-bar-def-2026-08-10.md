# Implement report: Wave 1 Track C -- FullHost bar definition

**Date:** 2026-08-10
**Repo:** `/home/hunter/Projects/ai/iso`
**Name:** FullHost bar definition
**Kind:** docs / residual definition only. No product Lean. No claim-bool flip.

ASCII only. Plain American English.

---

## Goal

Write a checkable bar in plain English for when FullHost package elaborate done
(FullHost true) **may** be claimed. Define the bar. Do **not** flip the pin.

---

## Done when (evidence)

| # | Requirement | Evidence |
|---|-------------|----------|
| 1 | Research note has plain-English checkable criteria | `doc/dev/research/c2-fullhost-bar-criteria-2026-08-10.md` -- H1-H8 must-haves; N1-N13 not-enough; scope; process order; pin snapshot |
| 2 | Residual Decisions records bar locked; pin false | `RESIDUAL-systems.md` Decisions: **FullHost bar locked as definition (2026-08-10 Wave 1 C)** |
| 3 | No product Lean FullHostElaborateRemains flip | No edits under `src/systems/SystemsLean/`; pin remains false |
| 4 | `just hygiene` green | Gates below |
| 5 | Report on disk | this file |

---

## Bar summary (plain English)

**What FullHost would mean:** for the named SystemsLean host package under
`src/systems/`, package-scope elaborate residual that free bar (a) left open is
closed under real judgments and same-job honesty, with free bar still green and
lake elaborator proof on the claim surface.

**Must be true (H1-H8):** written bar authority; real package-scope judgments on
named seed set; same-job honesty; free bar (a) still green; product Lean claim
surface + lake proof (dual-ok redesign if re-using A66 pin polarity); orthogonal
pins unchanged unless separate residual; docs lockstep; hygiene.

**Not enough (selected):** Kernel Mult..Emit TERM alone; free bar (a) alone; A66
pin false alone; measured M1-M6 alone; four PACKAGE-ELABORATE bands alone; unit
PROOF alone; Mult..Compose foundation alone; grep-only claim flip; mathlib;
fullBackend; empty Open.

**Pin today:** `hostResidualShrinkFullHostElaborateRemains` = **false**. Free
dual-ok requires `!pin`. Flip residual must redesign dual-ok or prefer a
successor claim pin.

---

## Paths touched

| Path | Change |
|------|--------|
| `doc/dev/research/c2-fullhost-bar-criteria-2026-08-10.md` | Locked bar SSoT (expanded criteria) |
| `RESIDUAL-systems.md` | Decisions row; Open Name C done; Living Open; Next product work; Done archive row |
| `.agents/plans/plan-full-readiness-2026-08-09.md` | Living tip one line (bar locked) |
| `.agents/plans/plan-completeness-remaining-2026-08-10.md` | Living tip one line (bar locked) |
| `.agents/reports/impl-wave1-c-fullhost-bar-def-2026-08-10.md` | This report |

**Not touched:** product Lean; SESSION-HANDOFF (prefer not race Track A/B); WATCHER
(A/B still open; C done -- parent may reseed if needed); git.

---

## Pins (unchanged)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | true |
| FullHostElaborateRemains | **false** |
| product StillUsesLake / DependsOnLake | false |
| host free claimed (free bar a) | true |
| tip fullBackend | true A-light |
| band FullBackend | false |
| seed / harness | 206 / 49 |

---

## Out of scope (honored)

- FullHostElaborateRemains true
- KernelMult PROOF implement
- AffineDrop dual product
- mathlib
- host UX
- git commit

---

## Gates

```bash
just hygiene
# source-hygiene OK (1086 files; ASCII except allowlist; no trailing whitespace;
#   no stitch/merge markers); professional-tone OK (510 markdown files)
# exit 0
```

Note: first hygiene run RED on `src/lean4/examples/AffineDrop.lean` (Unicode
multiplication sign from parallel Track B). File now uses ASCII
`Prod Nat AffineRes`; hygiene re-run exit 0. Track C product paths stayed ASCII.

---

## Next

Wave 1 Tracks A and B remain open (KernelMult proof-layer checker; Affine drop
dual honesty). FullHost claim flip is **not** open: bar is locked; separate residual
+ lake required later if operator promotes.
