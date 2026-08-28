# Implement report: residual closeout after Term-surface for TypesSubsetRebuild

**Date:** 2026-08-13
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). `just hygiene` run after this report.

---

## Goal

Update living residual so the queue matches sibling evidence. Term-surface for
TypesSubsetRebuild closed GREEN with mop GREEN and reviews at 0 open. Mark that
Name **done**. Open next Name **Package-env for TypesSubsetRebuild**. Full host
package elaborate meet stays **done partial** (inventory plus PE43..PE66 plus
TERM through TypesSubsetRebuild; pin still false). Do not flip
`FullHostElaborateRemains`. Do not re-queue this TERM, LinearSubsetRebuild TERM,
PE66, or PE65. Do not open cold compose init unroll. Do not invent seed-wide
206, a FullHost flip, or a C product Name.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-types-subsetrebuild-term-2026-08-13.md` | GREEN. Companion 304. Harness 114->115. TERM 60->61. LoadOk 914. Accepts 989. Dialect living `typesSubsetRebuildSelfApplyOk` not `emitTypesReady`. Four ILL twins. Residual-free/complete claimed stay false. Ready includes `!typesSubsetRebuildWithoutLakeFinishedClaimed`. TDD red exit 1 then green. Wire 105 jobs. systems-host 334. |
| `/tmp/grok-1000/grok-impl-summary-tsr-term.md` | Same GREEN |
| Review/mop (trashed; verdict on impl row) | GREEN / APPROVE 0. See `impl-types-subsetrebuild-term-2026-08-13.md`. |
| Memory | flushed 0 new / 0 merged |
| Clone closeout shape | `.agents/reports/impl-residual-closeout-linear-subsetrebuild-term-2026-08-13.md` (TERM closeout that named the PE twin) |
| `.agents/reports/impl-residual-closeout-package-env-linear-subsetrebuild-2026-08-13.md` | Prior PE lockstep (named this TERM as next; that Name is now product-done) |

Living product counts after this TERM (do not invent different numbers):

- Seed **206**
- Harness **115**
- TERM dual-ok **61**
- LoadOk **914**
- Accepts **989**
- TypesSubsetRebuild TERM companion **304**
- PackageEnv **964** (untouched)
- Evidence **787** (untouched)
- EvidenceLater **267** (untouched; later PE must append here)
- FixturesS5 **990**
- FixturesLater **294** (S17+S18+S19+S20; later PE fixtures go here)
- systems-host **334**

---

## Inventory of next seed after TypesSubsetRebuild

Spot-checked (no product Lean logic edit):

| Check | Result |
|-------|--------|
| Seed after `SystemsLean.TypesSubsetRebuild` | `SystemsLean.ProgramSubsetRebuild` in both `HostModuleCheckSeeds.lean` and `HostImportGraphSeeds.lean` |
| Existing `HostModuleCheckTypesSubsetRebuildTerm.lean` | **yes** (304; this TERM just landed) |
| Existing `HostModuleCheckProgramSubsetRebuildTerm.lean` | **none** |
| Existing PE67 / S21 / `hostModuleCheckGoodPackageEnvS21Text` | **none** |
| `packageEnvTermSurfaceOk` fold | ends at `hostModuleCheckLinearSubsetRebuildTermSurfaceOk`; does **not** yet fold `hostModuleCheckTypesSubsetRebuildTermSurfaceOk` |
| CompilePath rebuild import helper | `packageBodyImportsCompilePathTypes` **exists** (same helper TypesSubsetEmit PE58 already used). Soft J2 for the next PE is CompilePath-only (no EmitRebuild farm). |
| Living TypesSubsetRebuild claims | residual-free **false**; complete **false**; self-apply + wrote-expected + ready. This unit is rebuild / self-apply, **not** emit. Ready includes `!typesSubsetRebuildWithoutLakeFinishedClaimed`. |
| Earlier units through LinearSubsetRebuild | TERM + package-env both landed |
| TypesSubsetRebuild | TERM landed; PE twin **missing** |
| Established meet path | TERM first, then PE twin |

Honest next Open is **Package-env for TypesSubsetRebuild** (PE67 / S21).
Walking ProgramSubsetRebuild TERM now would skip the PE twin for the unit
that just got TERM. This is not a re-queue of this TERM, LinearSubsetRebuild
TERM, PE66, or PE65.

This unit is rebuild / self-apply, not emit. PE twin Soft J2 stays
CompilePath-only (`packageBodyImportsCompilePathTypes`; no emit-module farm).
Do **not** invent an EmitRebuild farm.

---

## Why Package-env for TypesSubsetRebuild is the honest next

The established FullHost meet path is TERM first, then the package-env twin,
walking the real host seed in order.

| Check | Result |
|-------|--------|
| This TERM just landed | TypesSubsetRebuild now has TERM dual-ok **61** / harness **115** |
| PE twin for that unit | **missing** (package-env still through PE66 / S20) |
| Next seed ProgramSubsetRebuild | has **no** TERM companion, and comes **after** this PE |
| Seed-wide 206 / mathlib / FullHost flip | not this Open |
| Cold compose init unroll | stays not open |
| C product-meaning Name | not invented |

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Term-surface for TypesSubsetRebuild **done**; Package-env for TypesSubsetRebuild **open**; Full host meet stays **done partial** (inventory plus PE43..PE66 plus TERM through TypesSubsetRebuild; pin still false); two-target table row 36 done / row 37 open; Done archive lockstep line; living tip + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Package-env for TypesSubsetRebuild. Fence `/implement --effort 2 Package-env for TypesSubsetRebuild`. Did not re-queue this TERM, LinearSubsetRebuild TERM, PE66, or PE65. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next / Remaining; table rows; WATCHER tip |
| `.agents/reports/impl-residual-closeout-types-subsetrebuild-term-2026-08-13.md` | This report |
| `/tmp/grok-1000/grok-impl-summary-residual-closeout-tsr-term.md` | Short summary for the parent |

No product Lean. No emit C. No just modules. No claim-bool flips.

`src/systems/host-partial-inventory.md` DualResidual harness snapshot was not
rewritten. Living counts stay in residual / WATCHER / handoff.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA / llvm-as / richer layout / link smoke / LLVM timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE66 + TERM through TypesSubsetRebuild; pin still false; next named meet-path is Package-env for TypesSubsetRebuild |
| Package-env for CompilePath unit TERM | **done** | PE45..PE52 |
| Term-surface for CompilePath Plan Apply Body | **done** | |
| Package-env for CompilePath Plan Apply Body | **done** | PE53..PE55 |
| Term-surface for FirstSurface | **done** | |
| Package-env for FirstSurface | **done** | PE56 / S10 |
| Term-surface for LinearSubsetEmit | **done** | |
| Package-env for LinearSubsetEmit | **done** | PE57 / S11 |
| Term-surface for TypesSubsetEmit | **done** | |
| Package-env for TypesSubsetEmit | **done** | PE58 / S12 |
| Term-surface for ProgramSubsetEmit | **done** | |
| Package-env for ProgramSubsetEmit | **done** | PE59 / S13 |
| Term-surface for GraphSubsetEmit | **done** | |
| Package-env for GraphSubsetEmit | **done** | PE60 / S14 |
| Term-surface for ComposeSubsetEmit | **done** | |
| Package-env for ComposeSubsetEmit | **done** | PE61 / S15 |
| Term-surface for ErasureSubsetEmit | **done** | |
| Package-env for ErasureSubsetEmit | **done** | PE62 / S16 |
| Term-surface for ExtractSubsetEmit | **done** | |
| Package-env for ExtractSubsetEmit | **done** | PE63 / S17 |
| Term-surface for MultSubsetEmit | **done** | harness 112 at land; TERM 58 at land; companion 274 |
| Package-env for MultSubsetEmit | **done** | PE64 / S18 |
| Term-surface for MultSubsetRebuild | **done** | harness **113**; TERM **59**; companion **303**; pin still false |
| Package-env for MultSubsetRebuild | **done** | PE65 / S19 |
| Term-surface for LinearSubsetRebuild | **done** | harness **114**; TERM **60**; companion **303**; pin still false |
| Package-env for LinearSubsetRebuild | **done** | PE66 / S20; FixturesS5 990 / FixturesLater 294 / PackageEnv 964 / Evidence 787 / EvidenceLater 267 |
| Term-surface for TypesSubsetRebuild | **done** | harness **115**; TERM **61**; companion **304**; pin still false |
| Package-env for TypesSubsetRebuild | **open** | Highest-value next; clone PE66; PE67 / S21; pin stays false |
| Term-surface for ProgramSubsetRebuild | **not this Open** | next seed after this PE twin |
| Cold compose init unroll | **not open** | operator notes stay not open |

Highest-value next: **Package-env for TypesSubsetRebuild**.

Expected PE land: harness stays **115**; TERM stays **61**; E-good S21 = S20 ++
TypesSubsetRebuild using `hostModuleCheckGoodTypesSubsetRebuildReadyMultilineText`;
dialect S21 after S20 LinearSubsetRebuild; Soft J5
`checkTypesSubsetRebuildTermDialect` at package scope; Soft J2 CompilePath-only
(`packageBodyImportsCompilePathTypes`; honest; no EmitRebuild farm);
`packageEnvTermSurfaceOk` folds
`hostModuleCheckTypesSubsetRebuildTermSurfaceOk`; later-fold helper
`packageEnvDialectRejectsIllTyped` covers PE45..PE67 after the land.

---

## Evidence later-fold note

Evidence is **787** (PE1..PE44 plus combined Ok). EvidenceLater is **267**
(later-fold PE45..PE66). PE67 **must append to EvidenceLater**, not grow
Evidence. FixturesS5 is **990**; append S21 fixtures to
`HostModuleCheckPackageEnvFixturesLater.lean` (294), not FixturesS5.
PackageEnv is **964** (headroom under 1000).

---

## Next Name contract (living)

Name: Package-env for TypesSubsetRebuild

Goal: Add the package-env twin (PE67 / S21) so TypesSubsetRebuild TERM is
visible at package scope.

Done when (checkable; clone PE66):

- E-good S21 = S20 ++ TypesSubsetRebuild using TERM multi-line ready helper
  (`hostModuleCheckGoodTypesSubsetRebuildReadyMultilineText`).
- Dialect S21 after S20 LinearSubsetRebuild.
- Soft J2 CompilePath-only (`packageBodyImportsCompilePathTypes`; no
  emit-module farm; this unit is rebuild / self-apply; do **not** invent an
  EmitRebuild farm).
- Soft J5 `checkTypesSubsetRebuildTermDialect` at package scope.
- `packageEnvTermSurfaceOk` folds `hostModuleCheckTypesSubsetRebuildTermSurfaceOk`.
- Residual-free claimed true is ILL-TYPED-TERM; L0 package tokens still accept.
- Dialect body living `typesSubsetRebuildSelfApplyOk` + wrote-expected, **not**
  `emitTypesReady`.
- EvidenceLater gets PE67. Do **not** grow Evidence.
- S21 fixtures in FixturesLater, not FixturesS5 (990).
- PackageEnv stays under 1000 (now 964).
- Harness stays **115**. TERM stays **61**.
- FullHostElaborateRemains stays **false**.
- `just hygiene` plus focused lake family plus `just systems-host` green.

Out of scope: FullHost flip; seed-wide 206 / mathlib; DominanceClaimed / band
FullBackend; product C; product Rust; Term-surface for ProgramSubsetRebuild
(TERM for the next seed comes after this PE); rewrite of TypesSubsetRebuild
TERM; re-queue PE66; re-queue PE65; re-queue LinearSubsetRebuild TERM; cold
compose init unroll; inventing a C fail-closed residual; flipping residual-free
/ complete claimed; `emitTypesReady` as dialect clone; growing Evidence (use
EvidenceLater); growing FixturesS5.

---

## Pin proof (FullHost stays false)

This lockstep did not edit `hostResidualShrinkFullHostElaborateRemains`.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed / band
FullBackend edits. TypesSubsetRebuild residual-free and complete claimed
stay false.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| irNodeLayoutFullBackendClaimed / rustIrInteropFullBackendClaimed | **false** (untouched) |
| seed / harness / TERM dual-ok | 206 / 115 / 61 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43..PE66 (PE66 / S20 landed; this PE is next as PE67 / S21; scope string still SurfaceMatrixEnv-only; not seed-wide) |
| PackageEnv line counts | FixturesS5 990; FixturesLater 294; PackageEnv 964; Evidence 787; EvidenceLater 267 (all under 1000) |
| TypesSubsetRebuild residual-free / complete claimed | **false** |
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
- Re-queue this TERM, LinearSubsetRebuild TERM, PE66, or PE65
- Opening ProgramSubsetRebuild TERM now
- Opening cold compose init unroll
- Invented C fail-closed residual
- Presenting a new plan
- New product Lean

---

## Hygiene

`just hygiene`: **exit 0** (1480 files; 800 markdown). source-hygiene OK;
professional-tone OK. Prior TypesSubsetRebuild TERM mop hygiene was 1476
files / 796 markdown. Extra novel markdown is this closeout plus
residual/handoff already in tree. `/tmp` summary is outside the tree.

---

## Next implement

WATCHER fence:

```
/implement --effort 2 Package-env for TypesSubsetRebuild
```

Do not implement that product Lean in this lockstep.
