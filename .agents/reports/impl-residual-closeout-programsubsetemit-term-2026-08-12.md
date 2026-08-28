# Implement report: residual closeout after Term-surface for ProgramSubsetEmit

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product
Lean, theorems, or product C. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). `just hygiene` run after this report.

---

## Goal

Update living residual so the queue matches sibling evidence. Term-surface for
ProgramSubsetEmit closed GREEN with reviews at 0 open. Mark that Name **done**.
Open next Name **Package-env for ProgramSubsetEmit**. Full host package
elaborate meet stays **done partial**. Do not flip `FullHostElaborateRemains`.
Do not re-queue ProgramSubsetEmit typed term-surface. Do not open cold compose
init unroll. Do not invent seed-wide 206 or a FullHost flip.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `/tmp/grok-1000/grok-impl-summary-pse-term.md` | GREEN. New `HostModuleCheckProgramSubsetEmitTerm.lean` 269. Harness 106 -> 107. TERM dual-ok 52 -> 53. LoadOk 914. |
| `.agents/reports/impl-programsubsetemit-term-2026-08-12.md` | GREEN. Same product slice. Pin stays false. Package-env twins out of scope. |
| `.agents/reports/process-mop-programsubsetemit-term-2026-08-12.md` | GREEN. No product edits. |
| `.agents/reports/review-general-programsubsetemit-term-2026-08-12.md` | APPROVE 0 open |
| `.agents/reports/review-tests-programsubsetemit-term-2026-08-12.md` | APPROVE 0 open |

Spot-checked (no product Lean logic edit):

- Seed string after ProgramSubsetEmit is `SystemsLean.GraphSubsetEmit` in
  `HostModuleCheckSeeds.lean` (ideal ladder Graph subset emit). No
  `HostModuleCheckGraphSubsetEmitTerm` exists.
- After a TERM land, the next checkable slice is still the package-env twin
  (every TERM unit gets a PE twin before the next TERM).
- Seed string stays 206 (living partition seed=206+Main=59+harness=107).
- Living counts: harness **107**, TERM dual-ok **53**, LoadOk **914**.

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Term-surface for ProgramSubsetEmit **done**; Package-env for ProgramSubsetEmit **open**; Full host meet stays **done partial**; living tip + highest-value next + Done archive + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Package-env for ProgramSubsetEmit. Fence `/implement --effort 2 Package-env for ProgramSubsetEmit`. Did not re-queue ProgramSubsetEmit TERM. Did not open cold compose init unroll. Did not open Term-surface for GraphSubsetEmit. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next; table rows |
| `.agents/reports/impl-residual-closeout-programsubsetemit-term-2026-08-12.md` | This report |

No emit C. No just modules. No Nix. No claim-bool flips. No product Lean
comment edits (reviewer already named ProgramSubsetEmit on the later fold).

`src/systems/host-partial-inventory.md` DualResidual harness=42 is a dated
snapshot. Did not rewrite it. Living counts stay in residual / WATCHER /
handoff.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA / llvm-as / richer layout / link smoke / LLVM timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE58; ProgramSubsetEmit TERM landed; pin still false |
| Package-env for CompilePath unit TERM | **done** | PE45..PE52 |
| Term-surface for CompilePath Plan Apply Body | **done** | |
| Package-env for CompilePath Plan Apply Body | **done** | PE53..PE55 |
| Term-surface for FirstSurface | **done** | |
| Package-env for FirstSurface | **done** | PE56 / S10 |
| Term-surface for LinearSubsetEmit | **done** | harness 105 at land; TERM 51 at land; pin false |
| Package-env for LinearSubsetEmit | **done** | PE57 / S11; harness 105 at land; TERM 51 at land |
| Term-surface for TypesSubsetEmit | **done** | harness 106 at land; TERM 52 at land; pin false |
| Package-env for TypesSubsetEmit | **done** | PE58 / S12; harness 106 at land; TERM 52 at land |
| Term-surface for ProgramSubsetEmit | **done** | harness 107; TERM 53; pin false |
| Package-env for ProgramSubsetEmit | **open** | Highest-value next; PE twin; PE59 / S13 not landed; pin stays false |
| Cold compose init unroll | **not open** | operator notes stay not open |

Highest-value next: **Package-env for ProgramSubsetEmit**.

Why this Name: ProgramSubsetEmit now has TERM dual-ok. The PE58 TypesSubsetEmit
pattern is the next checkable meet-path twin (expected PE59 / S13). The next
real seed after ProgramSubsetEmit is GraphSubsetEmit, which still lacks TERM.
That TERM waits until this PE twin lands. This is not seed-wide 206. This is
not a FullHost flip. This is not a re-queue of ProgramSubsetEmit TERM.

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
| seed / harness / TERM dual-ok | 206 / 107 / 53 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43/PE44 plus PE45..PE58 (PE59 not landed; scope string still SurfaceMatrixEnv-only; not seed-wide) |
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
- Rewrite of HostModuleCheckProgramSubsetEmitTerm
- Invented C fail-closed residual
- Cold compose init unroll
- Re-queue ProgramSubsetEmit TERM
- Opening Term-surface for GraphSubsetEmit before the PE twin
- Presenting a new plan

---

## Hygiene

`just hygiene` after docs: **exit 0** (1390 files; 720 markdown).
source-hygiene OK; professional-tone OK.

---

## Next implement prompt (same as WATCHER fence)

/implement --effort 2 Package-env for ProgramSubsetEmit

Name: Package-env for ProgramSubsetEmit
Goal: Add package-env fixture twins for ProgramSubsetEmit now that the unit has TERM dual-ok.
Done when: PE twin for ProgramSubsetEmit residual-free claimed true is ILL-TYPED-TERM; L0 still accepts. E-good package-env text grows S12 good ++ ProgramSubsetEmit using the real multi-line programSubsetEmitReady body (hostModuleCheckGoodPackageEnvS13Text). Dialect checkPackageEnvDialectS13 (or next unused S-number after S12) after S12 TypesSubsetEmit succeeds. Soft J2 CompilePathProgram-only (no emit-module farm). Soft J5 ProgramSubsetEmit TERM dialect at package scope. No new harness module (count stays 107). TERM dual-ok stays 53. FullHostElaborateRemains stays false. just hygiene plus focused lake on PackageEnv family plus just systems-host green.
Out of scope: FullHost flip / FULLHOST_FLIP; seed-wide 206 / mathlib; DominanceClaimed / band FullBackend; product C; product Rust under src/; rewrite of HostModuleCheckProgramSubsetEmitTerm; re-queue ProgramSubsetEmit TERM; cold compose init unroll; inventing a C fail-closed residual; opening Term-surface for GraphSubsetEmit before this PE twin.
Paths: src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesS5.lean; HostModuleCheckPackageEnv.lean; HostModuleCheckPackageEnvEvidence.lean. Do not grow past Sub-1-KLOC; split if needed.
Gates: just hygiene; focused lake build of PackageEnv family; just systems-host. FULLHOST_FLIP=no.
