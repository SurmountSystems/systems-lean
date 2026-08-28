# Implement report: residual closeout after Term-surface for LinearSubsetEmit

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep plus one
comment-only honesty nit. No claim-bool flips. No Lean logic, theorems, or
product C.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep + comment nit). `just hygiene` run after
this report.

---

## Goal

Update living residual so the queue matches sibling evidence. Term-surface for
LinearSubsetEmit closed GREEN with reviews at 0 open. Mark that Name **done**.
Open next Name **Package-env for LinearSubsetEmit**. Full host package
elaborate meet stays **done partial**. Do not flip `FullHostElaborateRemains`.
Do not re-queue LinearSubsetEmit typed term-surface. Do not open cold compose
init unroll. Do not invent seed-wide 206 or a FullHost flip.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `/tmp/grok-1000/grok-impl-summary-linearsubsetemit-term.md` | GREEN. New `HostModuleCheckLinearSubsetEmitTerm.lean` 267. Harness 104 -> 105. TERM dual-ok 50 -> 51. LoadOk 914. |
| `.agents/reports/impl-linearsubsetemit-term-2026-08-12.md` | GREEN. Same product slice. Pin stays false. Package-env twins out of scope. |
| `.agents/reports/process-mop-linearsubsetemit-term-2026-08-12.md` | GREEN. hygiene 0; systems-host 322 paths; no product edits. |
| `.agents/reports/review-general-linearsubsetemit-term-2026-08-12.md` | APPROVE; one comment nit (LoadOk later-fold "through FirstSurface") |
| `.agents/reports/review-tests-linearsubsetemit-term-2026-08-12.md` | APPROVE 0 open |
| `/tmp/grok-1000/grok-review-linearsubsetemit-term.md` | Merged: 0 open |

Spot-checked (no product Lean logic edit):

- `hostResidualShrinkFullHostElaborateRemains := false` still in
  `src/systems/SystemsLean/HostResidualShrink.lean`.
- Seed string still `seed=206+Main=59+harness=105` (seed 206 unchanged).
- Living counts: harness **105**, TERM dual-ok **51**.

---

## Comment nit (reviewer APPROVE, not blocking)

`src/systems/SystemsLean/HostModuleCheckLoadOk.lean` header and the later-fold
comment around line 280 still said the fold ran "through FirstSurface." The
fold now includes LinearSubsetEmit (`hostModuleCheckLaterTermSurfaceOk`).

Updated comments only so they name LinearSubsetEmit as the current last unit
in the later fold ("EmitPlan through LinearSubsetEmit"). Did not change Lean
logic, theorems, or claim bools.

`HostModuleCheckLoadOkLaterTerm.lean` already named LinearSubsetEmit. Left
that file alone.

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Term-surface for LinearSubsetEmit **done**; Package-env for LinearSubsetEmit **open**; Full host meet stays **done partial**; living tip + highest-value next + Done archive + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Package-env for LinearSubsetEmit. Fence `/implement --effort 2 Package-env for LinearSubsetEmit`. Did not re-queue LinearSubsetEmit TERM. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next; table rows |
| `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` | Comments only: later fold includes LinearSubsetEmit |
| `.agents/reports/impl-residual-closeout-linearsubsetemit-term-2026-08-12.md` | This report |

No emit C. No just modules. No Nix. No claim-bool flips.

`src/systems/host-partial-inventory.md` DualResidual harness=42 is a dated
snapshot. Did not rewrite it. Living counts stay in residual / WATCHER /
handoff.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA lower partial | **done** | already done |
| SSA llvm-as expected set | **done** | already done |
| Richer-than-i32 layout | **done** | already done |
| IR consumer link smoke | **done** | already done |
| LLVM IR compile and run timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE56; pin still false |
| Package-env for CompilePath unit TERM | **done** | PE45..PE52 |
| Term-surface for CompilePath Plan Apply Body | **done** | |
| Package-env for CompilePath Plan Apply Body | **done** | PE53..PE55 |
| Term-surface for FirstSurface | **done** | |
| Package-env for FirstSurface | **done** | PE56 / S10 |
| Term-surface for LinearSubsetEmit | **done** | harness 105; TERM 51; pin false |
| Package-env for LinearSubsetEmit | **open** | Highest-value next; PE twin; pin stays false |
| Cold compose init unroll | **not open** | operator notes stay not open |

Highest-value next: **Package-env for LinearSubsetEmit**.

Why this Name: LinearSubsetEmit now has TERM dual-ok. The PE56 FirstSurface
pattern is the next checkable meet-path twin. This is not seed-wide 206. This
is not a FullHost flip. This is not a re-queue of LinearSubsetEmit TERM.

---

## Pin proof (FullHost stays false)

`src/systems/SystemsLean/HostResidualShrink.lean`:

`def hostResidualShrinkFullHostElaborateRemains : Bool := false`

This lockstep did not edit that pin. No FULLHOST_FLIP. No free / complete /
PROVABLY / DominanceClaimed / band FullBackend edits.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| seed / harness / TERM dual-ok | 206 / 105 / 51 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43/PE44 plus PE45..PE56 (scope string still SurfaceMatrixEnv-only; not seed-wide) |
| systems-emit-wire | green |
| FULLHOST_FLIP | no |
| Speed | empirical (`just bench-runtime`); never rename as PROVABLY |

No Lean claim-bool edits.

---

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckLinearSubsetEmitTerm
- Invented C fail-closed residual
- Cold compose init unroll
- Re-queue LinearSubsetEmit TERM
- Presenting a new plan

---

## Hygiene

`just hygiene` after docs + comment edit: **exit 0** (1368 files; 700 markdown).

---

## Next implement prompt (same as WATCHER fence)

/implement --effort 2 Package-env for LinearSubsetEmit

Name: Package-env for LinearSubsetEmit
Goal: Add package-env fixture twins for LinearSubsetEmit now that the unit has TERM dual-ok.
Done when: PE twin for LinearSubsetEmit residual-free claimed true is ILL-TYPED-TERM; L0 still accepts. E-good package-env text grows S10 good ++ LinearSubsetEmit using the real multi-line linearSubsetEmitReady body. Dialect checkPackageEnvDialectS11 (or next unused S-number after S10) after S10 FirstSurface succeeds. Soft J5 unit dialect at package scope. No new harness module (count stays 105). TERM dual-ok stays 51. FullHostElaborateRemains stays false. just hygiene plus focused lake on PackageEnv family plus just systems-host green.
Out of scope: FullHost flip / FULLHOST_FLIP; seed-wide 206 / mathlib; DominanceClaimed / band FullBackend; product C; product Rust under src/; rewrite of HostModuleCheckLinearSubsetEmitTerm; cold compose init unroll.
Paths: src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesS5.lean; HostModuleCheckPackageEnv.lean; HostModuleCheckPackageEnvEvidence.lean. Do not grow past Sub-1-KLOC; split if needed.
Gates: just hygiene; focused lake build of PackageEnv family; just systems-host. FULLHOST_FLIP=no.
