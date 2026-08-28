# Full host package elaborate meet (2026-08-12)

Kind: analysis plus one named next product slice. Not a FullHost pin flip.
Not free / complete / PROVABLY re-open. Not mathlib day-one. Not seed-wide 206.
Not LLVM SSA. Not emit C.

ASCII only. Plain American English. Date: 2026-08-12.

**Bar SSoT:** `doc/dev/research/c2-fullhost-bar-criteria-2026-08-10.md`
**Prior meet inventory:** `doc/dev/research/fullhost-meet-inventory-2026-08-11.md` (S7)
**Prior parity design:** `doc/dev/research/full-elaborator-parity-design-2026-08-07.md`
**Host finish program:** `.agents/plans/plan-slake-replaces-lake.md`

---

## 1. What this note is for

The operator asked to start the work so Slake does every job Lake still does
for host develop (full host package elaborate), without silently flipping
`FullHostElaborateRemains` or `FULLHOST_FLIP`.

This note answers three questions in ordinary English:

1. What does classic Lake still do that Slake does not own?
2. What is already claimed, and what those claims are not?
3. What is the one small checkable next slice on the meet path?

---

## 2. What Lake still does that Slake does not

For the SystemsLean host package under `src/systems/`, classic Lake
(`lake build` / `just systems-lake`) still:

| Lake job | Slake today | Gap |
|----------|-------------|-----|
| Load the package roots | Owned without Lake on the day-to-day step | Met for free bar (a) |
| Follow the import graph for the develop seed | Seed modules=206 without Lake | Met for the seed; *Main and harness stay carved out |
| Typecheck every module body the way Lean 4 does (defs, inductives, instances, proof terms) | HostModuleCheck is PARTIAL-STRUCTURAL plus named TERM / PROOF / package-env pilots | **Kernel depth.** Most of seed 206 is still key-decl greps |
| Elaborate theorem modules as Lake does | Named PROOF dual-ok on Mult / Linear / Types and Kernel Mult..Emit only | Proof check depth on the rest of *Theorems |
| Be the honest full-package sanity pass after a wipe or on a claim flip | Cold Lake remains bootstrap / emergency / claim-proof | Intended. Not a bug. Not FullHost done |

Slake already owns the **day-to-day shape** of host develop (roots, seed
import graph, structural module check, package write, foundation and
develop tools) without Lake on those steps. That is free bar (a). It is
**not** "Slake typechecks the package like Lake."

Seed-wide 206 real judgments and mathlib-scale Lean 4 elaborator parity
are **large**. This slice does not start them.

---

## 3. What is already claimed (and what it is not)

| Claim | Living value | What it is not |
|-------|--------------|----------------|
| Host residual free (free bar a) | **claimed** (remains false / free true) | Not full package elaborate. Not Lake gone. |
| FullHostElaborateRemains | **false** (A66) | Not "Slake owns full package elaborate." Cold Lake is just not the daily loop. |
| Full classic elaborator parity | **measured** under M1-M6 | Not seed-wide J1-J12. Not mathlib. |
| proofCompleteClaimed | **true** (Track 4c SpecProof bar) | Not FullHost. Not Lake-grade proof check of the library. |
| Product free / complete / PROVABLY | **true** | Orthogonal product wire claims. Preserve. |
| DominanceClaimed / band FullBackend | **false** | LLVM tracks. Not this meet. |
| Seed / harness | **206** / **99** | Harness 99 is HostModuleCheck family + import-graph tools, not 206 typechecked. |
| TERM dual-ok | **46** | Unit dialects. Not package-env. Not FullHost. |
| Package-env (before this slice) | Mult..ParityEmit + U2 + S5 (PE1..PE42) | Pilot only. SpecProof + DualResidual TERM were **not** in env. Eight CompilePath *unit* TERM modules (S8) are still not in env. |

**Hard non-equivalences (keep repeating after compaction):**

- Free claimed is not FullHost package elaborate done.
- FullHostElaborateRemains false is not FullHost package elaborate done.
- Measured M1-M6 is not seed-wide Lake typecheck.
- TERM dual-ok is not package-env, and package-env pilots are not seed-wide H2.

---

## 4. H1-H8 meet table (living 2026-08-12)

Bar must-haves from the locked criteria note. **FULLHOST_FLIP=no.**

| # | Criterion | Status | Why |
|---|-----------|--------|-----|
| H1 | Written bar authority | **met** | Criteria note locked |
| H2 | Named package surface closed under real accept/reject | **partial** | Package-env pilots + 46 unit TERM. Most of seed 206 still L0 greps. Not a flip surface. |
| H3 | Same-job honesty for package elaborate | **partial** | Without-Lake owns day-to-day tools. Full seed body typecheck is still cold Lake. |
| H4 | Free bar (a) still green | **met** | Free dual-ok requires FullHost pin false |
| H5 | Product Lean claim + lake proof | **unmet** | No flip this note. Pin stays false. |
| H6 | Orthogonal pins unchanged | **met** | free/complete/PROVABLY true; Dominance / FullBackend false |
| H7 | Docs lockstep | **this note** | Residual / WATCHER owned by sibling lockstep. Plan living tip updated. |
| H8 | Hygiene + report | **this slice** | `just hygiene` + report path below |

**Verdict:** FullHostElaborateRemains **false** stays honest. Do **not** flip.

---

## 5. One checkable next slice (small, on the meet path)

S7 named SpecProof + DualResidual TERM as dialect-only, **package-env
deferred**. Those two units already have TERM dual-ok (S6). They were the
only S6 pair still missing soft-J5 package-env twins.

| Field | Choice |
|-------|--------|
| Name | Package-env SpecProof and DualResidual |
| Why this, not seed-wide 206 | Two existing TERM units. Same PE pattern as S5 (PE39..PE42). Checkable E-good / E-bad. Not mathlib. Not a pin flip. |
| Why not S8 CompilePath units first | Eight more PE twins. Real, but larger. Honest next after this pair. |
| Why not HostTerm as a new TERM | HostTerm is a host tool, not the named deferred PE band. |
| Out of scope | FullHost true; seed-wide H2; mathlib; LLVM SSA; emit C; harness climb; claim-bool flips |

**This slice lands (product):** PE43 SpecProof + PE44 DualResidual stageId
twins inside the existing Mult..ParityEmit+U2+S5 greppable scope string
(just / Nix dual-pin still ends `...SurfaceMatrixEnv-only`). Dialect
requires those two modules after SurfaceMatrix. H2 stays **partial**.

**Recommended next Name after this slice:** Package-env for the eight
CompilePath unit TERM companions (CompilePathMult..Extract). Still a pilot.
Still not FullHost. Do not start seed-wide 206.

---

## 6. Non-claims

- Does not flip FullHostElaborateRemains / FULLHOST_FLIP
- Does not flip free / complete / PROVABLY / DominanceClaimed / band FullBackend
- Does not claim seed-wide package elaborate or mathlib
- Does not rename the greppable package-env scope string (gate lock)
- Does not touch residual / WATCHER / SESSION-HANDOFF (sibling lockstep)

**Report:** `.agents/reports/impl-fullhost-meet-progress-2026-08-12.md`
