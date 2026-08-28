# Implement report: residual closeout after Term-surface for ErasureSubsetEmit

**Date:** 2026-08-12
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). `just hygiene` run after this report.

---

## Goal

Update living residual so the queue matches sibling evidence. Term-surface for
ErasureSubsetEmit closed GREEN with reviews at 0 open. Mark that Name **done**.
Open next Name **Package-env for ErasureSubsetEmit**. Full host package
elaborate meet stays **done partial** (inventory plus PE43..PE61 plus this
TERM; this TERM is not PE62; pin still false). Do not flip
`FullHostElaborateRemains`. Do not re-queue ErasureSubsetEmit TERM. Do not
open a TERM for ExtractSubsetEmit until PE62 lands. Do not open cold compose
init unroll. Do not invent seed-wide 206 or a FullHost flip.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-erasure-subsetemit-term-2026-08-12.md` | GREEN. Companion 272. Harness 109 -> 110. TERM dual-ok 55 -> 56. Seed 206. Pin stays false. PackageEnv / Evidence untouched. |
| `.agents/reports/process-mop-erasure-subsetemit-term-2026-08-12.md` | GREEN. No product edits. |
| `.agents/reports/review-general-erasure-subsetemit-term-2026-08-12.md` | APPROVE 0 open |
| `.agents/reports/review-tests-erasure-subsetemit-term-2026-08-12.md` | APPROVE 0 open. Re-ran focused lake 14 jobs exit 0. |

Spot-checked (no product Lean logic edit):

- Seed list after `SystemsLean.ErasureSubsetEmit` is `SystemsLean.ExtractSubsetEmit`
  in `HostModuleCheckSeeds.lean` (ideal ladder Extract subset emit). That seed
  is the TERM after this PE twin, not this Open.
- `HostModuleCheckErasureSubsetEmitTerm.lean` is present (272).
- Evidence `HostModuleCheckPackageEnvEvidence.lean` is **996** lines (under
  Sub-1-KLOC). Did **not** open an Evidence long-file split Name. The PE twin
  must split Evidence in that PE slice if the land would exceed 1000.
- Seed 206 unchanged. Harness **110**. TERM dual-ok **56**. Package-env still
  through PE61 / S15 (PE62 not landed). This TERM is not PE62.

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Term-surface for ErasureSubsetEmit **done**; Package-env for ErasureSubsetEmit **open**; Full host meet stays **done partial**; living tip + highest-value next + Done archive + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Package-env for ErasureSubsetEmit. Fence `/implement --effort 2 Package-env for ErasureSubsetEmit`. Did not re-queue ErasureSubsetEmit TERM. Did not open ExtractSubsetEmit TERM. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next; table rows |
| `.agents/reports/impl-residual-closeout-erasure-subsetemit-term-2026-08-12.md` | This report |

No product Lean. No emit C. No just modules. No claim-bool flips.

`src/systems/host-partial-inventory.md` was not rewritten.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA / llvm-as / richer layout / link smoke / LLVM timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE61 + ErasureSubsetEmit TERM; pin still false; this TERM is not PE62 |
| Package-env for CompilePath unit TERM | **done** | PE45..PE52 |
| Term-surface for CompilePath Plan Apply Body | **done** | |
| Package-env for CompilePath Plan Apply Body | **done** | PE53..PE55 |
| Term-surface for FirstSurface | **done** | |
| Package-env for FirstSurface | **done** | PE56 / S10 |
| Term-surface for LinearSubsetEmit | **done** | harness 105 at land; TERM 51 at land; pin false |
| Package-env for LinearSubsetEmit | **done** | PE57 / S11; harness 105 at land; TERM 51 at land |
| Term-surface for TypesSubsetEmit | **done** | harness 106 at land; TERM 52 at land; pin false |
| Package-env for TypesSubsetEmit | **done** | PE58 / S12; harness 106 at land; TERM 52 at land |
| Term-surface for ProgramSubsetEmit | **done** | harness 107 at land; TERM 53 at land; pin false |
| Package-env for ProgramSubsetEmit | **done** | PE59 / S13; harness 107 at land; TERM 53 at land |
| Term-surface for GraphSubsetEmit | **done** | harness 108; TERM 54; pin false |
| Package-env for GraphSubsetEmit | **done** | PE60 / S14; harness 108; TERM 54; pin false |
| Term-surface for ComposeSubsetEmit | **done** | harness 109 at land; TERM 55 at land; pin false |
| Package-env for ComposeSubsetEmit | **done** | PE61 / S15; harness 109 at land; TERM 55 at land; pin false |
| Term-surface for ErasureSubsetEmit | **done** | harness 110; TERM 56; pin false |
| Package-env for ErasureSubsetEmit | **open** | Highest-value next; PE twin / PE62; pin stays false |
| Cold compose init unroll | **not open** | operator notes stay not open |
| Term-surface for ExtractSubsetEmit | **not this Open** | seed after the PE twin, after PE62 |

Highest-value next: **Package-env for ErasureSubsetEmit**.

Why this Name: ErasureSubsetEmit now has TERM dual-ok. Established meet path
is TERM first, then the PE twin. Clone PE61. This is not seed-wide 206. This
is not a FullHost flip. This is not a re-queue of ErasureSubsetEmit TERM.
This TERM is not PE62.

Expected PE land: harness stays 110; TERM stays 56; PE62 residual-free reject
plus E-good S16 plus dialect S16; Evidence starts 996 and must split in this
PE slice if the land would exceed 1000.

---

## Evidence long-file warning (do not open a split now)

`HostModuleCheckPackageEnvEvidence.lean` is **996** lines. Confirmed under
Sub-1-KLOC. Do not open a split Name now. The PE twin must split Evidence in
that PE slice if adding the twin would exceed 1000.

---

## Pin proof (FullHost stays false)

This lockstep did not edit `hostResidualShrinkFullHostElaborateRemains`.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed / band
FullBackend edits.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| seed / harness / TERM dual-ok | 206 / 110 / 56 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43/PE44 plus PE45..PE61 (PE62 not landed; scope string still SurfaceMatrixEnv-only; not seed-wide) |
| PackageEnv line counts | FixturesS5 925; PackageEnv 889; Evidence 996 (all under 1000; Evidence near the bar) |
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
- Re-queue ErasureSubsetEmit TERM
- Opening ExtractSubsetEmit TERM now
- Opening an Evidence long-file split Name now
- Invented C fail-closed residual
- Cold compose init unroll
- Presenting a new plan
- New product Lean
- Rewrite of `src/systems/host-partial-inventory.md`

---

## Next implement prompt (same as WATCHER fence)

/implement --effort 2 Package-env for ErasureSubsetEmit

Name: Package-env for ErasureSubsetEmit
Goal: Add package-env fixture twins for ErasureSubsetEmit now that the unit has TERM dual-ok (clone PE61 ComposeSubsetEmit package-env).
Done when: Surgical FixturesS5 / PackageEnv / Evidence. PE62: ErasureSubsetEmit residual-free claimed true is ILL-TYPED-TERM; L0 still accepts. E-good S16 = S15 good ++ ErasureSubsetEmit using multi-line ready. Dialect S16 after S15 ComposeSubsetEmit succeeds. Soft J2 CompilePathErasure-only (packageBodyImportsCompilePathErasure; no EmitErasure farm). Soft J5 checkErasureSubsetEmitTermDialect at package scope. Harness stays 110. TERM stays 56. Evidence starts 996: split Evidence in this PE slice if the land would exceed 1000. FullHost stays false. TDD: red Evidence after PE62 fold before S16 dialect; green after dialect. just hygiene plus focused lake on PackageEnv family plus just systems-host green.
Out of scope: FullHost flip; mathlib; DominanceClaimed; band FullBackend; product C; product Rust; opening ExtractSubsetEmit TERM; cold compose init unroll; inventing a C fail-closed residual.
Paths: HostModuleCheckPackageEnvFixturesS5.lean; HostModuleCheckPackageEnv.lean; HostModuleCheckPackageEnvEvidence.lean. Split Evidence in this slice if the land would exceed 1000. Do not grow past Sub-1-KLOC.
Gates: just hygiene; focused lake; just systems-host. FULLHOST_FLIP=no.

---

## Hygiene

`just hygiene`: **exit 0** (1423 files; 750 markdown). source-hygiene OK;
professional-tone OK. Prior ErasureSubsetEmit TERM implementer hygiene was
1418 files / 745 markdown. Extra novel markdown is this closeout plus
residual/handoff already in tree. `/tmp` summary is outside the tree.
