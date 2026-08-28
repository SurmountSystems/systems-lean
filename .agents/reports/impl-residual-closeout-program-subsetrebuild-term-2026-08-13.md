# Implement report: residual closeout after Term-surface for ProgramSubsetRebuild

**Date:** 2026-08-13
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). `just hygiene` run after this report.

---

## Goal

Update living residual so the queue matches sibling evidence. Term-surface for
ProgramSubsetRebuild closed GREEN with mop GREEN and reviews at 0 open. Mark that
Name **done**. Open next Name **Package-env for ProgramSubsetRebuild**. Full host
package elaborate meet stays **done partial** (inventory plus PE43..PE67 plus
TERM through ProgramSubsetRebuild; pin still false). Do not flip
`FullHostElaborateRemains`. Do not re-queue this TERM, TypesSubsetRebuild TERM,
PE67, or PE66. Do not open GraphSubsetRebuild TERM now. Do not open cold
compose init unroll. Do not invent seed-wide 206, a FullHost flip, or a C
product Name.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-program-subsetrebuild-term-2026-08-13.md` | GREEN. Companion 305. Harness 115->116. TERM 61->62. LoadOk 914. Accepts 990. Dialect living `programSubsetRebuildSelfApplyOk` not `emitProgramReady`. Four ILL twins. Residual-free/complete claimed stay false. Ready includes `!programSubsetRebuildWithoutLakeFinishedClaimed`. TDD red exit 1 then green. Wire 106 jobs. systems-host 335. |
| `/tmp/grok-1000/grok-impl-summary-psr-term.md` | Same GREEN if present |
| Review/mop (trashed; verdict on impl row) | GREEN / APPROVE 0. See `impl-program-subsetrebuild-term-2026-08-13.md`. |
| Memory | flushed 0 new / 0 merged |
| Clone closeout shape | `.agents/reports/impl-residual-closeout-types-subsetrebuild-term-2026-08-13.md` |

Living product counts after this TERM (do not invent different numbers):

- Seed **206**
- Harness **116**
- TERM dual-ok **62**
- LoadOk **914**
- Accepts **990** (near 1000; note for later TERM peels)
- ProgramSubsetRebuild TERM companion **305**
- PackageEnv **977** (untouched this slice)
- Evidence **789** (untouched)
- EvidenceLater **279** (untouched; later PE must append here)
- FixturesS5 **990**
- FixturesLater **363** (S17+S18+S19+S20+S21; later PE fixtures go here)
- systems-host **335**

---

## Inventory of next seed after ProgramSubsetRebuild

Spot-checked (no product Lean logic edit):

| Check | Result |
|-------|--------|
| Seed after `SystemsLean.ProgramSubsetRebuild` | `SystemsLean.GraphSubsetRebuild` in both `HostModuleCheckSeeds.lean` (line 443 after 442) and `HostImportGraphSeeds.lean` (line 409 after 408) |
| Existing `HostModuleCheckProgramSubsetRebuildTerm.lean` | **yes** (305; this TERM just landed) |
| Existing `HostModuleCheckGraphSubsetRebuildTerm.lean` | **none** |
| Existing PE68 / S22 / `hostModuleCheckGoodPackageEnvS22Text` | **none** |
| `packageEnvTermSurfaceOk` fold | ends at `hostModuleCheckTypesSubsetRebuildTermSurfaceOk`; does **not** yet fold `hostModuleCheckProgramSubsetRebuildTermSurfaceOk` |
| CompilePath rebuild import helper | `packageBodyImportsCompilePathProgram` **exists** (PackageEnv line 315). Soft J2 for the next PE is CompilePath-only (no EmitRebuild farm). |
| Living ProgramSubsetRebuild claims | residual-free **false**; complete **false**; self-apply + wrote-expected + ready. This unit is rebuild / self-apply, **not** emit. Ready includes `!programSubsetRebuildWithoutLakeFinishedClaimed`. |
| Earlier units through TypesSubsetRebuild | TERM + package-env both landed |
| ProgramSubsetRebuild | TERM landed; PE twin **missing** |
| Established meet path | TERM first, then PE twin |

Honest next Open is **Package-env for ProgramSubsetRebuild** (PE68 / S22).
Walking GraphSubsetRebuild TERM now would skip the PE twin for the unit
that just got TERM. This is not a re-queue of this TERM, TypesSubsetRebuild
TERM, PE67, or PE66.

This unit is rebuild / self-apply, not emit. PE twin Soft J2 stays
CompilePath-only (`packageBodyImportsCompilePathProgram`; no emit-module farm).
Do **not** invent an EmitRebuild farm.

---

## Why Package-env for ProgramSubsetRebuild is the honest next

The established FullHost meet path is TERM first, then the package-env twin,
walking the real host seed in order.

| Check | Result |
|-------|--------|
| This TERM just landed | ProgramSubsetRebuild now has TERM dual-ok **62** / harness **116** |
| PE twin for that unit | **missing** (package-env still through PE67 / S21) |
| Next seed GraphSubsetRebuild | has **no** TERM companion, and comes **after** this PE |
| Seed-wide 206 / mathlib / FullHost flip | not this Open |
| Cold compose init unroll | stays not open |
| C product-meaning Name | not invented |

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Term-surface for ProgramSubsetRebuild **done**; Package-env for ProgramSubsetRebuild **open**; Full host meet stays **done partial** (inventory plus PE43..PE67 plus TERM through ProgramSubsetRebuild; pin still false); two-target table row 38 done / row 39 open; Done archive lockstep line; living tip + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Package-env for ProgramSubsetRebuild. Fence `/implement --effort 2 Package-env for ProgramSubsetRebuild`. Did not re-queue this TERM, TypesSubsetRebuild TERM, PE67, or PE66. Did not open GraphSubsetRebuild TERM. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next / Remaining; table rows; WATCHER tip |
| `.agents/reports/impl-residual-closeout-program-subsetrebuild-term-2026-08-13.md` | This report |

No product Lean. No emit C. No just modules. No claim-bool flips.

`src/systems/host-partial-inventory.md` DualResidual harness snapshot was not
rewritten. Living counts stay in residual / WATCHER / handoff.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA / llvm-as / richer layout / link smoke / LLVM timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE67 + TERM through ProgramSubsetRebuild; pin still false; next named meet-path is Package-env for ProgramSubsetRebuild |
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
| Package-env for LinearSubsetRebuild | **done** | PE66 / S20 |
| Term-surface for TypesSubsetRebuild | **done** | harness **115**; TERM **61**; companion **304**; pin still false |
| Package-env for TypesSubsetRebuild | **done** | PE67 / S21; FixturesS5 990 / FixturesLater 363 / PackageEnv 977 / Evidence 789 / EvidenceLater 279 |
| Term-surface for ProgramSubsetRebuild | **done** | harness **116**; TERM **62**; companion **305**; pin still false |
| Package-env for ProgramSubsetRebuild | **open** | Highest-value next; clone PE67; PE68 / S22; pin stays false |
| Term-surface for GraphSubsetRebuild | **not this Open** | next seed after this PE twin |
| Cold compose init unroll | **not open** | operator notes stay not open |

Highest-value next: **Package-env for ProgramSubsetRebuild**.

Expected PE land: harness stays **116**; TERM stays **62**; E-good S22 = S21 ++
ProgramSubsetRebuild using `hostModuleCheckGoodProgramSubsetRebuildReadyMultilineText`;
dialect S22 after S21 TypesSubsetRebuild; Soft J5
`checkProgramSubsetRebuildTermDialect` at package scope; Soft J2 CompilePath-only
(`packageBodyImportsCompilePathProgram`; honest; no EmitRebuild farm);
`packageEnvTermSurfaceOk` folds
`hostModuleCheckProgramSubsetRebuildTermSurfaceOk`; later-fold helper
covers PE45..PE68 after the land.

---

## Evidence later-fold note

Evidence is **789** (PE1..PE44 plus combined Ok). EvidenceLater is **279**
(later-fold PE45..PE67). PE68 **must append to EvidenceLater**, not grow
Evidence. FixturesS5 is **990**; append S22 fixtures to
`HostModuleCheckPackageEnvFixturesLater.lean` (363), not FixturesS5.
PackageEnv is **977** (headroom under 1000). Accepts is **990** (near 1000;
later TERM peels must watch).

---

## Next Name contract (living)

Name: Package-env for ProgramSubsetRebuild

Goal: Add the package-env twin (PE68 / S22) so ProgramSubsetRebuild TERM is
visible at package scope.

Done when (checkable; clone PE67):

- E-good S22 = S21 ++ ProgramSubsetRebuild using TERM multi-line ready helper
  (`hostModuleCheckGoodProgramSubsetRebuildReadyMultilineText`).
- Dialect S22 after S21 TypesSubsetRebuild.
- Soft J2 CompilePath-only (`packageBodyImportsCompilePathProgram`; no
  emit-module farm; this unit is rebuild / self-apply; do **not** invent an
  EmitRebuild farm).
- Soft J5 `checkProgramSubsetRebuildTermDialect` at package scope.
- `packageEnvTermSurfaceOk` folds `hostModuleCheckProgramSubsetRebuildTermSurfaceOk`.
- Residual-free claimed true is ILL-TYPED-TERM; L0 package tokens still accept.
- Dialect body living `programSubsetRebuildSelfApplyOk` + wrote-expected, **not**
  `emitProgramReady`.
- Ready chain includes `!programSubsetRebuildWithoutLakeFinishedClaimed`.
- EvidenceLater gets PE68. Do **not** grow Evidence.
- S22 fixtures in FixturesLater, not FixturesS5 (990).
- PackageEnv stays under 1000 (now 977).
- Harness stays **116**. TERM stays **62**.
- FullHostElaborateRemains stays **false**.
- TDD: red Evidence `packageEnvDialectRejectsOk_true` before S22 dialect, then
  green.
- `just hygiene` plus focused lake family plus `just systems-host` green.

Out of scope: FullHost flip; seed-wide 206 / mathlib; DominanceClaimed / band
FullBackend; product C; product Rust; Term-surface for GraphSubsetRebuild
(TERM for the next seed comes after this PE); rewrite of ProgramSubsetRebuild
TERM; re-queue PE67; re-queue PE66; re-queue TypesSubsetRebuild TERM; re-queue
LinearSubsetRebuild TERM; cold compose init unroll; inventing a C fail-closed
residual; flipping residual-free / complete claimed; `emitProgramReady` as
dialect clone; growing Evidence (use EvidenceLater); growing FixturesS5.

---

## Pin proof (FullHost stays false)

This lockstep did not edit `hostResidualShrinkFullHostElaborateRemains`.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed / band
FullBackend edits. ProgramSubsetRebuild residual-free and complete claimed
stay false.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| irNodeLayoutFullBackendClaimed / rustIrInteropFullBackendClaimed | **false** (untouched) |
| seed / harness / TERM dual-ok | 206 / 116 / 62 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43..PE67 (PE67 / S21 landed; this PE is next as PE68 / S22; scope string still SurfaceMatrixEnv-only; not seed-wide) |
| PackageEnv line counts | FixturesS5 990; FixturesLater 363; PackageEnv 977; Evidence 789; EvidenceLater 279 (all under 1000) |
| ProgramSubsetRebuild residual-free / complete claimed | **false** |
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
- Re-queue this TERM, TypesSubsetRebuild TERM, PE67, or PE66
- Opening GraphSubsetRebuild TERM now
- Opening cold compose init unroll
- Invented C fail-closed residual
- Presenting a new plan
- New product Lean

---

## Hygiene

`just hygiene`: **exit 0** (1491 files; 810 markdown). source-hygiene OK;
professional-tone OK. Prior ProgramSubsetRebuild TERM mop hygiene was 1487
files / 806 markdown. Extra novel markdown is this closeout plus
residual/handoff already in tree.

---

## Next implement

WATCHER fence:

```
/implement --effort 2 Package-env for ProgramSubsetRebuild
```

Do not implement that product Lean in this lockstep.
